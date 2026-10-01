# Writing blog posts

The Blog has two categories: `paper-review` (논문 리뷰) and `study-note` (공부 기록). Posts appear newest first in their category.

1. Copy `_drafts/paper-review.md` or `_drafts/study-note.md` into `_posts/`.
2. Name the file `YYYY-MM-DD-short-title.md`, for example `2026-10-01-my-first-review.md`.
3. Replace the title, excerpt, and body. Keep the appropriate `category` value.
4. Preview the post locally. It appears automatically on `/blog/` and opens at `/blog/YYYY/MM/DD/short-title/`.

한국어와 영어 모두 쓸 수 있습니다. 제목과 본문 사이, 문단 사이에는 빈 줄을 넣습니다. 이미지와 코드는 일반 Markdown 문법으로 추가합니다.

Files in `_drafts/` are not published by a normal build. Moving a completed post into `_posts/` makes it part of the site's next build; pushing/deploying the site is a separate action.
