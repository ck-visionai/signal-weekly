import fs from 'node:fs/promises';
import path from 'node:path';
import mysql from 'mysql2/promise';

const baseUrl = process.env.CAREER_WEEKLY_BASE_URL || 'http://localhost:3000';
const outputDir = '/home/ubuntu/webdev-static-assets/career-weekly-library/future-editions';
const connection = await mysql.createConnection(process.env.DATABASE_URL);
const [rows] = await connection.execute('SELECT id, issueNumber, status, previewKey, completeKey FROM editions WHERE issueNumber BETWEEN 2 AND 100 ORDER BY issueNumber');
await connection.end();

const errors = [];
if (rows.length !== 99) errors.push(`expected 99 editions 02-100, found ${rows.length}`);
const publicRows = rows.filter((row) => row.issueNumber <= 12);
const privateRows = rows.filter((row) => row.issueNumber >= 13);
if (publicRows.length !== 11) errors.push(`expected 11 public validation rows 02-12, found ${publicRows.length}`);
if (privateRows.length !== 88) errors.push(`expected 88 private validation rows 13-100, found ${privateRows.length}`);
for (const row of privateRows) {
  if (row.status === 'published') errors.push(`edition ${row.issueNumber} must remain private`);
  if (!row.previewKey || !row.completeKey) errors.push(`edition ${row.issueNumber} missing private storage key`);
  for (const variant of ['preview', 'complete']) {
    const response = await fetch(`${baseUrl}/api/editions/${row.id}/${variant}`, { redirect: 'manual' });
    if (response.status !== 404) errors.push(`edition ${row.issueNumber} ${variant} expected 404 while private, got ${response.status}`);
  }
}

const releaseDb = await mysql.createConnection(process.env.DATABASE_URL);
const [releaseRows] = await releaseDb.execute('SELECT id, issueNumber, status FROM editions WHERE issueNumber BETWEEN 1 AND 12 ORDER BY issueNumber');
await releaseDb.end();
for (const row of releaseRows) {
  for (const variant of ['preview', 'complete']) {
    const response = await fetch(`${baseUrl}/api/editions/${row.id}/${variant}`, { redirect: 'manual' });
    if (![301, 302, 303, 307, 308].includes(response.status)) errors.push(`released edition ${row.issueNumber} ${variant} expected redirect, got ${response.status}`);
    if (!response.headers.get('location')) errors.push(`released edition ${row.issueNumber} ${variant} missing delivery location`);
  }
}

const typFiles = (await fs.readdir(outputDir)).filter((name) => /career-weekly-edition-(0[2-9]|[1-9][0-9]|100)-.*-(preview|complete)\.typ$/.test(name));
if (typFiles.length !== 198) errors.push(`expected 198 generated Typst sources for Editions 02-100, found ${typFiles.length}`);
for (const name of typFiles) {
  const source = await fs.readFile(path.join(outputDir, name), 'utf8');
  const centered = (source.match(/#align\(center\)/g) || []).length;
  if (centered !== 1) errors.push(`${name}: expected exactly one centered intro block, found ${centered}`);
  if (!source.includes('#set par(justify: false')) errors.push(`${name}: missing explicit left-alignment rule`);
}

console.log(`futureRows=${rows.length} releasedRows=${releaseRows.length} typSources=${typFiles.length} errors=${errors.length}`);
if (errors.length) {
  console.log(errors.slice(0, 40).join('\n'));
  process.exit(1);
}
