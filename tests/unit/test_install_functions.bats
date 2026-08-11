#!/usr/bin/env bats
# bats file_tags=unit

load '../helpers'

INSTALL_SCRIPT="${DOTFILES_ROOT}/install"

setup() {
    load_helpers
    setup_isolated_home
    cd "$DOTFILES_ROOT" || return
    # shellcheck disable=SC1090
    source "$INSTALL_SCRIPT"
}

teardown() {
    teardown_isolated_home
}

# ── check_sym_link ────────────────────────────────────────────────────────────

@test "check_sym_link creates a symlink when destination does not exist" {
    check_sym_link "$DOTFILES_ROOT/bin" "$HOME/bin"

    assert_link_exists "$HOME/bin"
    assert_equal "$(readlink "$HOME/bin")" "$DOTFILES_ROOT/bin"
}

@test "check_sym_link skips and reports when destination is already symlinked" {
    ln -s "$DOTFILES_ROOT/bin" "$HOME/bin"

    run check_sym_link "$DOTFILES_ROOT/bin" "$HOME/bin"

    assert_success
    assert_output --partial "linked:skipped"
}

@test "check_sym_link reports conflict when destination exists but is not a symlink" {
    mkdir "$HOME/bin"

    run check_sym_link "$DOTFILES_ROOT/bin" "$HOME/bin"

    assert_success
    assert_output --partial "not-linked:exists:skipped"
}

# ── options / WORK flag ───────────────────────────────────────────────────────

@test "WORK defaults to false when no flags are passed" {
    options
    assert_equal "$WORK" "false"
}

@test "-w flag sets WORK to true" {
    options -w
    assert_equal "$WORK" "true"
}
