<div align="center">

# asdf-ds-to-dhall ![Build](https://github.com/sourcegraph/asdf-ds-to-dhall/workflows/Build/badge.svg) ![Lint](https://github.com/sourcegraph/asdf-ds-to-dhall/workflows/Lint/badge.svg)

[ds-to-dhall](https://github.com/sourcegraph/ds-to-dhall) plugin for the [asdf version manager](https://asdf-vm.com).

</div>

# Contents

- [Dependencies](#dependencies)
- [Install](#install)
- [Why?](#why)
- [Contributing](#contributing)
- [License](#license)

# Dependencies

- `bash`, `curl`, `tar`: generic POSIX utilities.
- `SOME_ENV_VAR`: set this environment variable in your shell config to load the correct version of tool x.

# Install

Plugin:

```shell
asdf plugin add ds-to-dhall
# or
asdf plugin add https://github.com/sourcegraph/asdf-ds-to-dhall.git
```

ds-to-dhall:

```shell
# Show all installable versions
asdf list-all ds-to-dhall

# Install specific version
asdf install ds-to-dhall latest

# Set a version globally (on your ~/.tool-versions file)
asdf global ds-to-dhall latest

# Now ds-to-dhall commands are available
ds-to-dhall --help
```

Check [asdf](https://github.com/asdf-vm/asdf) readme for more instructions on how to
install & manage versions.

# Contributing

Contributions of any kind welcome! See the [contributing guide](contributing.md).

[Thanks goes to these contributors](https://github.com/sourcegraph/asdf-ds-to-dhall/graphs/contributors)!

# License

See [LICENSE](LICENSE) © [Geoffrey Gilmore](https://github.com/sourcegraph/)
