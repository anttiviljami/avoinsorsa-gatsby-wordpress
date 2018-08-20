#!/bin/bash

set -e

USAGE="update-site.sh <target env>"

# Check args
if [ -z "$1" ]; then
  echo $USAGE >&2;
  [[ "$0" = "$BASH_SOURCE" ]] && exit 1 || return 1;
fi

PUBLIC_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/../public" && pwd)"
BUCKET_URL=s3://$PROJECT_NAME-$1

echo "Syncing $PUBLIC_DIR to $BUCKET_URL..."

aws s3 sync $PUBLIC_DIR/ $BUCKET_URL

echo "Success!"
