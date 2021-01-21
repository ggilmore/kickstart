#!/usr/bin/env bash

cd "$(dirname "${BASH_SOURCE[0]}")"/..
set -euxo pipefail

# https://github.com/asdf-vm/asdf-nodejs#install
asdf plugin-add nodejs
~/.asdf/plugins/nodejs/bin/import-release-team-keyring

asdf plugin-add just https://github.com/ggilmore/asdf-just.git

OTHER_PACKAGES=(
  "dhall"
  "shellcheck"
  "shfmt"
  "fd"
  "yarn"
  "deno"
)

for package in "${OTHER_PACKAGES[@]}"; do
  asdf plugin-add "${package}"
done
