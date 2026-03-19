#!/bin/bash
# Add custom domains to Cloudflare Pages project
# Requires: CLOUDFLARE_API_TOKEN and CLOUDFLARE_ACCOUNT_ID
# Domains clarifid.ca and clarifid.ai must be in your Cloudflare account (as zones)

set -e

ACCOUNT_ID="${CLOUDFLARE_ACCOUNT_ID:-bba0430835d2f7cf6870443092b847ec}"
PROJECT="clarifid-website"
DOMAINS=("clarifid.ca" "clarifid.ai")

if [ -z "$CLOUDFLARE_API_TOKEN" ]; then
  echo "Error: CLOUDFLARE_API_TOKEN is required"
  echo "Create one at: https://dash.cloudflare.com/profile/api-tokens"
  exit 1
fi

for domain in "${DOMAINS[@]}"; do
  echo "Adding domain: $domain"
  curl -s -X POST "https://api.cloudflare.com/client/v4/accounts/${ACCOUNT_ID}/pages/projects/${PROJECT}/domains" \
    -H "Authorization: Bearer ${CLOUDFLARE_API_TOKEN}" \
    -H "Content-Type: application/json" \
    -d "{\"name\":\"${domain}\"}" | jq .
  echo ""
done

echo "Done. Verify at: https://dash.cloudflare.com/?to=/:account/pages/view/clarifid-website"
