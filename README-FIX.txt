AI IDEA SCORING V2.1 FIX

Replace these files in the GitHub repository:
- index.html
- admin.html
- assets/ai-pitching-bg.webp
- assets/ofm-b2s-logo.png

config.js is no longer required by V2.1.
You may delete config.js after confirming the site works.

Why:
The Supabase URL and publishable key are embedded directly in index.html/admin.html,
matching the loading method used by the earlier working version.

After uploading, wait about 1 minute and hard refresh:
Windows: Ctrl + F5
Mobile: close the browser tab and reopen the URL.
