# Contributing

Testing Locally:

```shell
asdf plugin test <plugin-name> <plugin-url> [--asdf-tool-version <version>] [--asdf-plugin-gitref <git-ref>] [test-command*]

#
asdf plugin test mage https://github.com/ggilmore/asdf-mage.git "mage --help"
```

Tests are automatically run in GitHub Actions on push and PR.
