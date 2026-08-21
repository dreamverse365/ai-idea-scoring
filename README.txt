# AI Idea Scoring V2

Files to upload to the root of your GitHub repository:

- index.html
- admin.html
- config.js
- assets/
  - ai-pitching-bg.webp
  - ofm-b2s-logo.png

## 1) Configure Supabase
Open `config.js` and paste your existing Supabase Project URL and Publishable Key.

## 2) Enable Admin Reset
Open `reset-setup.sql`, replace `YOUR_RESET_PIN_HERE` with your own PIN, then run the SQL once in Supabase SQL Editor.

Do NOT upload `reset-setup.sql` to GitHub if you leave your real PIN written in it.
After running successfully, the PIN is stored as a SHA-256 hash in Supabase.

## 3) GitHub
Upload/replace the files above and keep the same GitHub Pages setup.
