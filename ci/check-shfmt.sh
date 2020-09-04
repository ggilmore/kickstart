#!/usr/bin/env bash

echo "--- shfmt (ensure shell-scripts are formatted consistently)"

set -euo pipefail

cd "$(dirname "${BASH_SOURCE[0]}")"/..

if ! shfmt -d .; then
  echo "The scripts listed above aren't correctly formatted. Please run 'just format' from the repository root and commit the result."
  exit 1
fi
