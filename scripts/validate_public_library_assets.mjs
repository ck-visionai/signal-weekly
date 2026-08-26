import fs from 'node:fs/promises';
import os from 'node:os';
import path from 'node:path';
import { execFile } from 'node:child_process';
import { promisify } from 'node:util';
import mysql from 'mysql2/promise';

const execFileAsync = promisify(execFile);
const baseUrl = process.env.CAREER_WEEKLY_BASE_URL || 'http://localhost:3000';
const tempDir = await fs.mkdtemp(path.join(os.tmpdir(), 'career-weekly-public-'));
const db = await mysql.createConnection(process.env.DATABASE_URL);
const [rows] = await db.execute('SELECT id, issueNumber, title, status, previewKey, completeKey FROM editions WHERE issueNumber BETWEEN 1 AND 12 ORDER BY issueNumber');
await db.end();
const errors = [];
const records = [];
if (rows.length !== 12) errors.push(`expected 12 released editions, found ${rows.length}`);
for (const row of rows) {
  if (row.status !== 'published') errors.push(`edition ${row.issueNumber} is not published: ${row.status}`);
  for (const variant of ['preview', 'complete']) {
    const response = await fetch(`${baseUrl}/api/editions/${row.id}/${variant}`, { redirect: 'follow' });
    if (!response.ok) {
      errors.push(`edition ${row.issueNumber} ${variant} returned ${response.status}`);
      continue;
    }
    const filePath = path.join(tempDir, `${String(row.issueNumber).padStart(2, '0')}-${variant}.pdf`);
    await fs.writeFile(filePath, Buffer.from(await response.arrayBuffer()));
    const { stdout } = await execFileAsync('pdfinfo', [filePath]);
    const pages = Number((stdout.match(/^Pages:\s+(\d+)/m) || [])[1]);
    if (!Number.isInteger(pages)) errors.push(`edition ${row.issueNumber} ${variant} missing page count`);
    records.push({ issueNumber: row.issueNumber, title: row.title, variant, pages, key: variant === 'preview' ? row.previewKey : row.completeKey, file: path.basename(filePath) });
  }
}
const editionOne = records.filter((record) => record.issueNumber === 1);
if (editionOne.find((record) => record.variant === 'preview')?.pages !== 6) errors.push('Edition 01 Preview is not exactly 6 pages');
if (editionOne.find((record) => record.variant === 'complete')?.pages !== 11) errors.push('Edition 01 Complete is not exactly 11 pages');
const reportPath = '/home/ubuntu/career-weekly-v2/research/public-library-validation.json';
await fs.writeFile(reportPath, JSON.stringify({ baseUrl, records, errors }, null, 2));
console.log(`released=${rows.length} assets=${records.length} errors=${errors.length} report=${reportPath}`);
if (errors.length) {
  console.log(errors.join('\n'));
  process.exit(1);
}
