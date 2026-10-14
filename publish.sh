#!/usr/bin/env bash
set -euo pipefail

if [[ ! -f deploy.env ]]; then
  echo "Missing deploy.env. Copy deploy.env.example and add your server details."
  exit 1
fi

source deploy.env
: "${SERVER_ALIAS:?SERVER_ALIAS is required}"
: "${REMOTE_DIR:?REMOTE_DIR is required}"

echo "Publishing bahginitiative.com to ${SERVER_ALIAS}:${REMOTE_DIR}"
rsync -avz --delete \
  --exclude='.git/' \
  --exclude='deploy.env' \
  --exclude='deploy.env.example' \
  --exclude='publish.sh' \
  --exclude='README.md' \
  ./ "${SERVER_ALIAS}:${REMOTE_DIR}/"
echo "Done."
