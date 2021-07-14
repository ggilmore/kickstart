#!/usr/bin/env bash

cd "$(dirname "${BASH_SOURCE[0]}")"/..
set -eu pipefail

FORMAT_ARGS=(
  "fmt"
  "--ignore=node_modules/"

)

if [ "${CHECK:-"false"}" == "true" ]; then
  FORMAT_ARGS+=("--check")
fi

deno "${FORMAT_ARGS[@]}"
