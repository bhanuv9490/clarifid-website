# Clarifid Website

Public-facing marketing website for [Clarifid](https://clarifid.ca) — Explainable AI Fraud Intelligence for Lending.

## Development

```bash
npm install
npm run dev
```

## Build

```bash
npm run build
```

Output is in `dist/`.

## Deploy to Cloudflare Pages

### Option A: Git integration (recommended)

1. Push this repo to GitHub
2. Cloudflare Dashboard → Pages → Create project → Connect to Git
3. Build settings:
   - Build command: `npm run build`
   - Build output directory: `dist`
4. Add custom domains: `clarifid.ca`, `clarifid.ai`

### Option B: Wrangler CLI

```bash
npx wrangler pages project create clarifid-website
npm run build
npx wrangler pages deploy dist --project-name=clarifid-website
```

## Custom domains

- **clarifid.ca** — Primary (Canadian HQ)
- **clarifid.ai** — Alternate (AI-focused branding)

Both can point to the same Pages project. Configure in Pages → Custom domains.
