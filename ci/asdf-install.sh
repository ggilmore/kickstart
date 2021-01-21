#!/usr/bin/env bash

cd "$(dirname "${BASH_SOURCE[0]}")"/..
set -euxo pipefail

DEFAULT_JUST_VERSION="${DEFAULT_JUST_VERSION:-0.8.3}"
asdf install just "${DEFAULT_JUST_VERSION}"
asdf global just "${DEFAULT_JUST_VERSION}"

just install
