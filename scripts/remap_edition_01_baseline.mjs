import fs from 'node:fs/promises';
import mysql from 'mysql2/promise';

const log = await fs.readFile('/home/ubuntu/career-weekly-v2/research/edition-01-baseline-upload-results.txt', 'utf8');
const mapping = new Map();
for (const line of log.split(/\r?\n/)) {
  const match = line.match(/^\[SUCCESS\] (.+?) -> \/manus-storage\/(.+)$/);
  if (match) mapping.set(match[1], match[2]);
}
const previewKey = mapping.get('career-weekly-edition-01-career-evidence-working-page-preview.pdf');
const completeKey = mapping.get('career-weekly-edition-01-career-evidence-working-page-complete.pdf');
if (!previewKey || !completeKey) throw new Error('Edition 01 baseline upload mappings are incomplete');

const db = await mysql.createConnection(process.env.DATABASE_URL);
try {
  await db.beginTransaction();
  await db.execute(
    `UPDATE editions SET slug = ?, title = ?, subtitle = ?, previewKey = ?, completeKey = ?, previewContent = ?, completeContent = ?, previewPages = 6, completePages = 11, masthead = 'CAREER WEEKLY · A SIGNRL PUBLICATION', summary = ? WHERE issueNumber = 1`,
    [
      'edition-01-career-evidence-working-page',
      'The Career Evidence Working Page',
      'Turn broad claims into credible evidence.',
      previewKey,
      completeKey,
      'The Preview Edition introduces the evidence-first argument, gives context for the working page, and ends with one concise exercise. Download the full edition for the full editorial briefing and working pages.',
      'The full edition explains how to make career claims easier to evaluate, develops the argument through examples and guidance, and ends with three action pages for applying the method to one real role or project.',
      'The immutable Career Weekly free guide for turning broad career claims into credible evidence.',
    ],
  );
  const [rows] = await db.execute('SELECT id FROM editions WHERE issueNumber = 1');
  if (!rows[0]?.id) throw new Error('Edition 01 row was not found');
  await db.execute('DELETE FROM editionSources WHERE editionId = ?', [rows[0].id]);
  await db.execute(
    'INSERT INTO editionSources (editionId, title, url, publisher, note) VALUES (?, ?, ?, ?, ?)',
    [rows[0].id, 'U.S. Department of Labor — Job Seekers', 'https://www.dol.gov/agencies/eta/job-seekers', 'U.S. Department of Labor', 'Validated public source used for the immutable free-guide baseline.'],
  );
  await db.commit();
  console.log(JSON.stringify({ issueNumber: 1, previewKey, completeKey, previewPages: 6, completePages: 11 }));
} catch (error) {
  await db.rollback();
  throw error;
} finally {
  await db.end();
}
