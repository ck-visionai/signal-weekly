# Career Weekly PDF Branding Audit

**Audit scope:** 24 released PDF assets in the public 12-edition window, covering Preview and Complete variants for Editions 01–12.

**Audit result:** All 24 assets downloaded successfully through the protected `/api/editions/:id/:variant` delivery routes. All 24 extracted-text files contain the approved masthead `CAREER WEEKLY · A SIGNRL PUBLICATION`. None of the 24 extracted-text files contains the retired name `Signal Weekly`.

Edition 01 now resolves to the verified immutable baseline: **6 pages for Preview** and **11 pages for Complete**.

| Check | Result |
|---|---:|
| Assets checked | 24 |
| Successful downloads | 24 |
| Approved masthead present | 24 |
| Retired “Signal Weekly” references found | 0 |
| 4-page PDFs | 11 |
| 6-page PDFs | 1 |
| 11-page PDFs | 3 |
| 12-page PDFs | 2 |
| 13-page PDFs | 2 |
| 14-page PDFs | 2 |
| 15-page PDFs | 3 |

The raw tab-separated report, downloaded PDFs, and extracted text files are retained alongside this document under `validation/pdf-branding/` for reproducibility. The audit follows storage redirects through the server delivery route and therefore verifies the actual public assets rather than only database metadata.
