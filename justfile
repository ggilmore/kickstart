build: render-ci-pipeline format lint

render-ci-pipeline:
    dhall-to-yaml --file ci/dhall/workflow.dhall --output ".github/workflows/ci.yaml" --generated-comment

format: format-dhall prettier format-shfmt

lint: format lint-dhall shellcheck

prettier:
    yarn run prettier

format-dhall:
    ./scripts/format.sh

lint-dhall:
    ./scripts/lint.sh

shellcheck:
    ./ci/shellcheck.sh

format-shfmt:
    shfmt -w .

install: install-asdf install-yarn

install-yarn:
    yarn

install-asdf:
    asdf install
