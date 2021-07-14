#!/usr/bin/env bash

cd "$(dirname "${BASH_SOURCE[0]}")"/..
set -eu pipefail

DHALL_FILES=()

mapfile -t DHALL_FILES < <(scripts/ls-dhall-files.sh)

dhall format "${DHALL_FILES[@]}"
