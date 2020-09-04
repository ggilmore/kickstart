<div align="center">

# asdf-just ![Build](https://github.com/ggilmore/asdf-just/workflows/Build/badge.svg) ![Lint](https://github.com/ggilmore/asdf-just/workflows/Lint/badge.svg)

[just](https://github.com/casey/just) plugin for the [asdf version manager](https://asdf-vm.com).

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
asdf plugin add just
# or
asdf plugin add just https://github.com/ggilmore/asdf-just.git
```

just:

```shell
# Show all installable versions
asdf list-all just

# Install specific version
asdf install just latest

# Set a version globally (on your ~/.tool-versions file)
asdf global just latest

# Now just commands are available
just --help
```

Check [asdf](https://github.com/asdf-vm/asdf) readme for more instructions on how to
install & manage versions.

# Contributing

Contributions of any kind welcome! See the [contributing guide](contributing.md).

[Thanks goes to these contributors](https://github.com/ggilmore/asdf-just/graphs/contributors)!

# License

See [LICENSE](LICENSE) © [Geoffrey Gilmore](https://github.com/ggilmore/)
