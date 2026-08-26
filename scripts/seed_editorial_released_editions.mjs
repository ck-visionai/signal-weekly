import fs from 'node:fs/promises';
import mysql from 'mysql2/promise';

const manifestPath = '/home/ubuntu/webdev-static-assets/career-weekly-library/future-editions/editorial-released-library-manifest.json';
const uploadPath = '/home/ubuntu/career-weekly-v2/research/editorial-released-pdf-upload-results.txt';
const manifest = JSON.parse(await fs.readFile(manifestPath, 'utf8'));
const uploadLog = await fs.readFile(uploadPath, 'utf8');
const storageByFile = new Map();
for (const line of uploadLog.split(/\r?\n/)) {
  const match = line.match(/^\[SUCCESS\] (.+?) -> \/manus-storage\/(.+)$/);
  if (match) storageByFile.set(match[1], match[2]);
}
if (manifest.length !== 11 || storageByFile.size !== 22) {
  throw new Error(`Expected 11 issues and 22 uploads; got ${manifest.length} and ${storageByFile.size}`);
}

const connection = await mysql.createConnection(process.env.DATABASE_URL);
try {
  await connection.beginTransaction();
  for (const item of manifest) {
    if (item.issueNumber < 2 || item.issueNumber > 12) throw new Error(`Unexpected issue number ${item.issueNumber}`);
    const previewKey = storageByFile.get(item.previewFile);
    const completeKey = storageByFile.get(item.completeFile);
    if (!previewKey || !completeKey) throw new Error(`Missing storage mapping for edition ${item.issueNumber}`);
    const slug = `edition-${String(item.issueNumber).padStart(2, '0')}-${item.title.toLowerCase().replace(/[^a-z0-9]+/g, '-').replace(/^-|-$/g, '')}`;
    const editorialLead = `${item.title} examines a specific career decision through evidence, context, and judgment rather than generic confidence language.`;
    const previewContent = `${editorialLead} The Preview Edition introduces the central argument, a practical example, and one concise exercise. Download the full edition for the full editorial briefing and working pages.`;
    const completeContent = `${editorialLead} The full edition develops the argument through issue-specific explanation, examples, practical guidance, common failure modes, and three final action pages for applying the idea to one real role, project, conversation, or decision.`;
    const summary = `${item.subtitle} Editorial briefing with a final three-page action sequence for working professionals.`;
    await connection.execute(
      `UPDATE editions SET slug = ?, title = ?, subtitle = ?, previewKey = ?, completeKey = ?, previewContent = ?, completeContent = ?, previewPages = ?, completePages = ?, masthead = 'CAREER WEEKLY · A SIGNRL PUBLICATION', summary = ? WHERE issueNumber = ?`,
      [slug, item.title, item.subtitle, previewKey, completeKey, previewContent, completeContent, item.previewPages, item.completePages, summary, item.issueNumber],
    );
    const [rows] = await connection.execute('SELECT id FROM editions WHERE issueNumber = ?', [item.issueNumber]);
    const editionId = rows[0]?.id;
    if (!editionId) throw new Error(`Edition ${item.issueNumber} does not exist`);
    await connection.execute('DELETE FROM editionSources WHERE editionId = ?', [editionId]);
    await connection.execute(
      'INSERT INTO editionSources (editionId, title, url, publisher, note) VALUES (?, ?, ?, ?, ?)',
      [editionId, item.source.title, item.source.url, item.source.publisher, 'Validated public source used for the editorial research trail behind this issue.'],
    );
  }
  await connection.commit();
  console.log(JSON.stringify({ updatedIssues: manifest.length, updatedPdfs: storageByFile.size }));
} catch (error) {
  await connection.rollback();
  throw error;
} finally {
  await connection.end();
}
