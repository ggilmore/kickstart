#!/usr/bin/env bash

set -euo pipefail

# TODO: Ensure this is the correct GitHub homepage where releases can be downloaded for mage.
GH_REPO="https://github.com/magefile/mage"

fail() {
    echo -e "asdf-mage: $*"
    exit 1
}

curl_opts=(-fsSL)

# NOTE: You might want to remove this if mage is not hosted on GitHub releases.
if [ -n "${GITHUB_API_TOKEN:-}" ]; then
    curl_opts=("${curl_opts[@]}" -H "Authorization: token $GITHUB_API_TOKEN")
fi

sort_versions() {
    sed 'h; s/[+-]/./g; s/.p\([[:digit:]]\)/.z\1/; s/$/.z/; G; s/\n/ /' |
        LC_ALL=C sort -t. -k 1,1 -k 2,2n -k 3,3n -k 4,4n -k 5,5n | awk '{print $2}'
}

list_github_tags() {
    git ls-remote --tags --refs "$GH_REPO" |
        grep -o 'refs/tags/.*' | cut -d/ -f3- |
        sed 's/^v//' # NOTE: You might want to adapt this sed to remove non-version strings from tags
}

list_all_versions() {
    # TODO: Adapt this. By default we simply list the tag names from GitHub releases.
    # Change this function if mage has other means of determining installable versions.
    list_github_tags
}

get_platform() {
    local platform

    platform="$(uname)"
    case $platform in
    'Linux')
        platform='Linux'
        ;;
    'Darwin')
        platform='macOS'
        ;;
    *) ;;
    esac

    echo "${platform}-64bit"
}

download_release() {
    local version filename url platform
    version="$1"
    filename="$2"
    platform=$(get_platform)

    # TODO: Adapt the release URL convention for mage
    url="$GH_REPO/releases/download/v${version}/mage_${version}_${platform}.tar.gz"

    echo "* Downloading mage release $version..."
    curl "${curl_opts[@]}" -o "$filename" -C - "$url" || fail "Could not download $url"
}

install_version() {
    local install_type="$1"
    local version="$2"
    local install_path="$3"
    local platform
    platform=$(get_platform)

    if [ "$install_type" != "version" ]; then
        fail "asdf-mage supports release installs only"
    fi

    # TODO: Adapt this to proper extension and adapt extracting strategy.
    local release_file="$install_path/mage_${version}_${platform}.tar.gz"
    local install_path_bin="${install_path}/bin"
    (
        mkdir -p "$install_path_bin"
        download_release "$version" "$release_file"
        tar -xzf "$release_file" -C "${install_path_bin}" || fail "Could not extract $release_file"
        rm "$release_file"

        local tool_cmd
        tool_cmd="${install_path_bin}/mage"
        test -x "${tool_cmd}" || fail "Expected ${tool_cmd} to be executable."

        if ! "${tool_cmd}" --help; then
            fail "'${tool_cmd} --help' failed."
        fi

        echo "mage $version installation was successful!"
    ) || (
        rm -rf "$install_path"
        fail "An error ocurred while installing mage $version."
    )
}
