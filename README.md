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

To add custom domains:

1. Ensure `clarifid.ca` and `clarifid.ai` are added to your Cloudflare account (DNS)
2. Go to [Cloudflare Dashboard](https://dash.cloudflare.com) → Pages → clarifid-website → Custom domains
3. Click "Set up a custom domain" and add `clarifid.ca` and `clarifid.ai`
4. Cloudflare will provision SSL and configure DNS automatically

## GitHub Actions

Add these secrets to your GitHub repo for automatic deployment on push to `main`:

- `CLOUDFLARE_API_TOKEN` — Create at [Cloudflare API Tokens](https://dash.cloudflare.com/profile/api-tokens) (template: Edit Cloudflare Workers)
- `CLOUDFLARE_ACCOUNT_ID` — Found in Dashboard URL or Workers & Pages overview
