#!/usr/bin/env bash

cd "$(dirname "${BASH_SOURCE[0]}")"/..
set -eu pipefail

DHALL_FILES=()
mapfile -t DHALL_FILES < <(scripts/ls-dhall-files.sh)

OPTIONS=(
  "lint"
)

if [ "${CHECK:-"false"}" == "true" ]; then
  OPTIONS+=("--check")
fi

LINT_ARGS=("${OPTIONS[@]}" "${DHALL_FILES[@]}")

dhall "${LINT_ARGS[@]}"
