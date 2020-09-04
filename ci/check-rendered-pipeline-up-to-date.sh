#!/usr/bin/env bash

cd "$(dirname "${BASH_SOURCE[0]}")"/..
set -euxo pipefail

just build

git diff --exit-code .github/workflows/ci.yaml
