# Kickstart ![CI](https://github.com/ggilmore/kickstart/workflows/CI/badge.svg)

Kickstart is my personal template repository that bootstaps:

- The [`just` command runner](https://github.com/casey/just) from https://github.com/casey/just
- Scripts that check style / formatting via:
  - [`dhall format`/`dhall-lint`](https://dhall-lang.org/): https://dhall-lang.org/
  - [`shellcheck`](https://www.shellcheck.net/): https://www.shellcheck.net/
  - [`shfmt`](https://github.com/mvdan/sh): https://github.com/mvdan/sh
  - [`prettier`](https://prettier.io/): https://prettier.io/
- A Github Actions CI pipeline powered by [dhall](https://dhall-lang.org/) that enforces all of the above
- `deno` to assist with writing scripts that would be too messy for bash

# Dependencies

- [asdf version manager](https://asdf-vm.com/#/core-manage-asdf-vm?id=install)

# Install

1. Add the following asdf plugins:

- dhall
  - `asdf plugin-add dhall`
- shellcheck
  - `asdf plugin-add dhall`
- shfmt
  - `asdf plugin-add shfmt`
- fd
  - `asdf plugin-add fd`
- yarn
  - `asdf plugin-add yarn`
- deno
  - `asdf plugin-add deno`
- node
  - ```bash
    # https://github.com/asdf-vm/asdf-nodejs#install
    asdf plugin-add nodejs
    ~/.asdf/plugins/nodejs/bin/import-release-team-keyring
    ```
- just
  - `asdf plugin-add just https://github.com/ggilmore/asdf-just.git`

1. Run `asdf install` to install all the tools specified in [.tool-versions](./.tool-versions)
1. Run `just install` to install all the packages

# Usage

Run `just all` to render the CI pipeline, format, and lint all files

# License

See [LICENSE](LICENSE) © [Geoffrey Gilmore](https://github.com/ggilmore/)
