#!/usr/bin/env bash

cd "$(dirname "${BASH_SOURCE[0]}")"/..
set -euo pipefail

DHALL_FILES=()
mapfile -t DHALL_FILES < <(scripts/ls-dhall-files.sh)

# https://unix.stackexchange.com/a/256201
function my_chronic() {
  tmp=$(mktemp) || return # this will be the temp file w/ the output
  "$@" >"$tmp" 2>&1       # this should run the command, respecting all arguments
  ret=$?
  [ "$ret" -eq 0 ] || cat "$tmp" # if $? (the return of the last run command) is not zero, cat the temp file
  rm -f "$tmp"
  return "$ret" # return the exit status of the command
}

export -f my_chronic

function check() {
  local file="$1"

  local CHECK_ARGS=(
    "dhall"
  )

  if [[ "${CI:-"false"}" == "true" ]] || [[ "${DHALL_CHECK_EXPLAIN:-"false"}" == "true" ]]; then
    CHECK_ARGS+=("--explain")
  fi

  CHECK_ARGS+=("--file")
  CHECK_ARGS+=("${file}")

  result=$(my_chronic "${CHECK_ARGS[@]}" 2>&1)
  rc=$?

  if [ -n "$result" ]; then
    echo "${file}:"
    echo "$result"
    echo
  fi

  return "$rc"
}
export -f check

./scripts/parallel_run.sh check {} ::: "${DHALL_FILES[@]}"
