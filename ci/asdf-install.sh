#!/usr/bin/env bash

cd "$(dirname "${BASH_SOURCE[0]}")"/..
set -euxo pipefail

DEFAULT_JUST_VERSION="${DEFAULT_JUST_VERSION:-0.7.2}"
asdf install just "${DEFAULT_JUST_VERSION}"
asdf global just "${DEFAULT_JUST_VERSION}"

just install
