#!/usr/bin/env bash
set -euo pipefail

if [[ ! -f deploy.env ]]; then
  echo "Missing deploy.env. Copy deploy.env.example and add your server details."
  exit 1
fi

source deploy.env
: "${SERVER_ALIAS:?SERVER_ALIAS is required}"
: "${REMOTE_REPO_DIR:?REMOTE_REPO_DIR is required}"
: "${REMOTE_APP_DIR:?REMOTE_APP_DIR is required}"
: "${PHP_BIN:?PHP_BIN is required}"

echo "Publishing bahginitiative.com to ${SERVER_ALIAS}..."

rsync -avz --delete \
  --exclude='.env' \
  --exclude='.git/' \
  --exclude='deploy.env' \
  --exclude='vendor/' \
  --exclude='writable/' \
  ./ "${SERVER_ALIAS}:${REMOTE_REPO_DIR}/"

ssh "${SERVER_ALIAS}" bash -s -- "${REMOTE_REPO_DIR}" "${REMOTE_APP_DIR}" "${PHP_BIN}" <<'REMOTE'
set -euo pipefail
REPO_DIR="$1"
APP_DIR="$2"
PHP_BIN="$3"
composer install --no-dev --optimize-autoloader --working-dir="$REPO_DIR"
mkdir -p "$APP_DIR"
rsync -av --delete --exclude='.env' --exclude='.git/' --exclude='writable/' "$REPO_DIR"/ "$APP_DIR"/
mkdir -p "$APP_DIR/writable"
chmod -R 775 "$APP_DIR/writable" || true
cd "$APP_DIR"
"$PHP_BIN" spark cache:clear || true
REMOTE

echo "Done."
