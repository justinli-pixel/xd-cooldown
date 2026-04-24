# XD Cooldown

A 15-minute end-of-tax-season reflection exercise for the TurboTax XD team. Built with Vite + React + Tailwind.

---

## 🚀 Get a live URL (pick one path)

### Option A — StackBlitz (fastest, no GitHub needed) · ~30 seconds

1. Go to **https://stackblitz.com/fork/vite-react**
2. Delete the default files in the left panel
3. Drag this entire `xd-cooldown` folder into the file tree
4. It installs and runs automatically
5. Click the URL at the top — that's your link. Share it with anyone.

StackBlitz URLs look like `stackblitz.com/edit/vitejs-vite-xyz123` and are public by default.

---

### Option B — GitHub + Vercel (best for sharing permanently) · ~5 minutes

No command line needed — everything runs in the browser.

**1. Create a GitHub repo**
   - Go to **https://github.com/new**
   - Name it `xd-cooldown`, make it public (or private — Vercel works with both), click **Create**

**2. Upload the files**
   - On the empty repo page, click **"uploading an existing file"** (or drag directly into the page)
   - Select all files inside this `xd-cooldown` folder and drop them
   - Scroll down, click **Commit changes**

**3. Deploy to Vercel**
   - Go to **https://vercel.com/new**
   - Sign in with GitHub (click "Continue with GitHub" — authorize when prompted)
   - Find your `xd-cooldown` repo in the list, click **Import**
   - Leave all settings at defaults (Vercel auto-detects Vite)
   - Click **Deploy**

**You get a live URL** like `xd-cooldown-yourname.vercel.app` in ~60 seconds. This is the one you share.

> **Tip:** Vercel also lets you set a custom domain in Project Settings → Domains if you want something like `xd-cooldown.design`.

---

### Option C — One command (if you have `gh` and `vercel` CLI installed) · ~30 seconds

```bash
cd xd-cooldown
./deploy.sh
```

See `deploy.sh` — it inits the repo, creates the GitHub repo, pushes, and deploys to Vercel in one shot.

---

## 🧪 Run it locally (optional)

If you want to preview it on your machine before deploying:

```bash
cd xd-cooldown
npm install
npm run dev
```

Then open http://localhost:5173

---

## 📁 What's in here

```
xd-cooldown/
├── src/
│   ├── XDCooldown.jsx      ← the main component (all the magic)
│   ├── main.jsx            ← React entry point
│   └── index.css           ← Tailwind directives
├── public/
│   └── favicon.svg
├── index.html
├── package.json
├── vite.config.js
├── tailwind.config.js
├── postcss.config.js
├── deploy.sh               ← one-command deploy helper
└── README.md               ← you are here
```

---

## 🛠️ Customizing

- **Copy/questions** — edit the `STEPS` array at the top of `src/XDCooldown.jsx`
- **Colors** — edit the `BONE`, `INK`, `CORAL`, `LEMON` constants at the top of the same file
- **Moods** — the `MOOD_DICT` and `MOOD_DESIGN` objects control keyword detection and color palettes for the Wrapped slides

Changes push live to Vercel automatically on every `git push` once connected.
