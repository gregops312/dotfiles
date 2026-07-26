#!/usr/bin/env bash

DOTFILES_ROOT="$(cd "$(dirname "$BATS_TEST_FILENAME")/../.." && pwd)"

load_helpers() {
    local libs="${DOTFILES_ROOT}/tests/libs"
    load "${libs}/bats-support/load"
    load "${libs}/bats-assert/load"
    load "${libs}/bats-file/load"
}

setup_isolated_home() {
    export ORIGINAL_HOME="$HOME"
    export ORIGINAL_PATH="$PATH"
    export HOME="${BATS_TEST_TMPDIR}/home"
    mkdir -p "$HOME/.config"
}

teardown_isolated_home() {
    export HOME="$ORIGINAL_HOME"
    export PATH="$ORIGINAL_PATH"
}

get_inode() {
    if [[ "$(uname)" == "Darwin" ]]; then
        stat -f '%i' "$1"
    else
        stat --format '%i' "$1"
    fi
}

get_link_count() {
    if [[ "$(uname)" == "Darwin" ]]; then
        stat -f '%l' "$1"
    else
        stat --format '%h' "$1"
    fi
}
