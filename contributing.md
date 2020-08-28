# Contributing

Testing Locally:

```shell
asdf plugin test <plugin-name> <plugin-url> [--asdf-tool-version <version>] [--asdf-plugin-gitref <git-ref>] [test-command*]

#
asdf plugin test ds-to-dhall https://github.com/sourcegraph/asdf-ds-to-dhall.git "ds-to-dhall --help"
```

Tests are automatically run in GitHub Actions on push and PR.
