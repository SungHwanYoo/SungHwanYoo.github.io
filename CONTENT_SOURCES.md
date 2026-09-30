# Content sources and editorial notes

Reviewed September 30, 2026.

- Profile, experience, projects, education, and awards: https://www.linkedin.com/in/sunghwan-yoo-1328492b8/
- Korean conference titles, author order, and publication years: https://sites.google.com/site/gachoncvip/publication/domestic
- Lab context: https://sites.google.com/site/gachoncvip
- U-Net implementation and framework: https://github.com/SungHwanYoo/UNet_Deblurring
- The owner supplied the portrait and confirmed the public email dksl1233@gachon.ac.kr and master's major in Artificial Intelligence in this chat.

Korean paper titles are the original titles. English translations are descriptive, not claims of official English titles. Journal manuscripts remain explicitly under submission. No public paper PDFs or private project demos were provided, so no download/demo links are implied.

The freelance project's reported 87% accuracy is omitted pending clarification of its metric and evaluation protocol. Manuscript coauthor lists and expected M.S. graduation date remain unconfirmed and are omitted. Private 5G contributions are research/reporting and scenario planning, not implementation of the collaborating lab's simulation.

## Editing

- Profile and email: `_config.yml`.
- Homepage and CV: `_pages/about.md`, `_pages/cv.md`.
- Publications: `_publications/`; use `status: submitted` until a manuscript is accepted/published.
- Projects: `_portfolio/`; `featured: true` places a project on the homepage.
- Appearance: `_sass/layout/_personal.scss`.
- Regression check: `bundle exec ruby tests/publication_status_test.rb`.
- Build: `bundle exec jekyll build`.
