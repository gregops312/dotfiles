#!/usr/bin/env bats
# bats file_tags=files
#
# Run these after a successful ./install inside the Docker container.
# They assert the expected post-install filesystem state.

load '../helpers'

setup() {
    load_helpers
    cd "$DOTFILES_ROOT" || return
}

# ── Symlinks (from config.json) ───────────────────────────────────────────────

@test "[links] every config.json entry is symlinked to its source" {
    local key source target count=0
    while IFS=$'\t' read -r key source target; do
        [[ -L "$HOME/$target" ]] || fail "[$key] not a symlink: ~/$target"
        [[ "$(readlink "$HOME/$target")" == "${DOTFILES_ROOT}/$source" ]] \
            || fail "[$key] ~/$target -> $(readlink "$HOME/$target"), expected ${DOTFILES_ROOT}/$source"
        count=$((count + 1))
    done < <(jq -r 'to_entries[] | [.key, .value.source, .value.target] | @tsv' config.json)
    assert [ "$count" -gt 0 ]
}

@test "[links] bin/ is symlinked to ~/bin" {
     assert_link_exists "$HOME/bin"
     assert_equal "$(readlink "$HOME/bin")" "${DOTFILES_ROOT}/bin"
 }

@test "[links] gitconfig is symlinked to ~/.gitconfig" {
    assert_link_exists "$HOME/.gitconfig"
    assert_equal "$(readlink "$HOME/.gitconfig")" "${DOTFILES_ROOT}/conf/gitconfig"
}

@test "[links] gitconfig-personal is symlinked to ~/.gitconfig-personal" {
    assert_link_exists "$HOME/.gitconfig-personal"
    assert_equal "$(readlink "$HOME/.gitconfig-personal")" "${DOTFILES_ROOT}/conf/gitconfig-personal"
}

@test "[links] gitconfig-work is symlinked to ~/.gitconfig-work" {
    assert_link_exists "$HOME/.gitconfig-work"
    assert_equal "$(readlink "$HOME/.gitconfig-work")" "${DOTFILES_ROOT}/conf/gitconfig-work"
}

@test "[links] vimrc is symlinked to ~/.vimrc" {
    assert_link_exists "$HOME/.vimrc"
    assert_equal "$(readlink "$HOME/.vimrc")" "${DOTFILES_ROOT}/conf/vimrc"
}

@test "[links] tmux.conf is symlinked to ~/.tmux.conf" {
    assert_link_exists "$HOME/.tmux.conf"
    assert_equal "$(readlink "$HOME/.tmux.conf")" "${DOTFILES_ROOT}/conf/tmux.conf"
}

@test "[links] zshrc is symlinked to ~/.zshrc" {
    assert_link_exists "$HOME/.zshrc"
    assert_equal "$(readlink "$HOME/.zshrc")" "${DOTFILES_ROOT}/conf/zshrc"
}

@test "[links] starship.toml is symlinked to ~/.config/starship.toml" {
    assert_link_exists "$HOME/.config/starship.toml"
    assert_equal "$(readlink "$HOME/.config/starship.toml")" "${DOTFILES_ROOT}/conf/starship.toml"
}

@test "[links] greg-kman theme is symlinked into oh-my-zsh themes" {
    assert_link_exists "$HOME/.oh-my-zsh/themes/greg-kman.zsh-theme"
    assert_equal "$(readlink "$HOME/.oh-my-zsh/themes/greg-kman.zsh-theme")" "${DOTFILES_ROOT}/conf/greg-kman.zsh-theme"
}

@test "[links] zsh-functions is symlinked to ~/.zsh-functions" {
    assert_link_exists "$HOME/.zsh-functions"
    assert_equal "$(readlink "$HOME/.zsh-functions")" "${DOTFILES_ROOT}/zsh-functions"
}

@test "[links] helix config dir is symlinked to ~/.config/helix" {
    assert_link_exists "$HOME/.config/helix"
    assert_equal "$(readlink "$HOME/.config/helix")" "${DOTFILES_ROOT}/conf/helix"
}

# ── Installed tools ───────────────────────────────────────────────────────────

@test "[tools] oh-my-zsh is installed" {
    assert_dir_exists "$HOME/.oh-my-zsh"
}

@test "[tools] starship is on PATH" {
    run command -v starship
    assert_success
}

@test "[tools] helix (hx) is on PATH" {
    run command -v hx
    assert_success
}

@test "[tools] helix (hx) reports its version" {
    run hx --version
    assert_success
    assert_output --partial "helix"
}

@test "[tools] neovim (nvim) is on PATH" {
    run command -v nvim
    assert_success
}

@test "[tools] neovim (nvim) reports its version" {
    run nvim --version
    assert_success
    assert_output --partial "NVIM"
}

@test "[tools] vundle is installed" {
    assert_dir_exists "$HOME/.vim/bundle/Vundle.vim"
}

# Installed by install_deps (git, vim and zsh are explicit on Linux, stock on macOS).
@test "[tools] autojump is on PATH" { run command -v autojump; assert_success; }
@test "[tools] direnv is on PATH"   { run command -v direnv;   assert_success; }
@test "[tools] fzf is on PATH"      { run command -v fzf;      assert_success; }
@test "[tools] git is on PATH"      { run command -v git;      assert_success; }
@test "[tools] jq is on PATH"       { run command -v jq;       assert_success; }
@test "[tools] tmux is on PATH"     { run command -v tmux;     assert_success; }
@test "[tools] vim is on PATH"      { run command -v vim;      assert_success; }
@test "[tools] zsh is on PATH"      { run command -v zsh;      assert_success; }

# ── Configs ───────────────────────────────────────────────────────────────────

@test "[config] helix config file is present under ~/.config/helix" {
    # NOTE: source file is named 'config..toml' (two dots) in conf/helix/.
    # Helix looks for 'config.toml' — this test reflects the deployed state.
    assert_file_exists "$HOME/.config/helix/config.toml"
}

@test "[config] helix languages.toml is present under ~/.config/helix" {
    assert_file_exists "$HOME/.config/helix/languages.toml"
}

@test "[config] ~/.gitconfig parses and every includeIf target exists" {
    run git config --file "$HOME/.gitconfig" --list
    assert_success

    local paths
    paths="$(git config --file "$HOME/.gitconfig" --get-regexp '^includeif\..*\.path$' | awk '{print $2}')"
    assert [ -n "$paths" ]

    local path
    while read -r path; do
        [[ -f "${path/#\~/$HOME}" ]] || fail "includeIf target missing: $path"
    done <<< "$paths"
}

@test "[config] ~/.tmux.conf parses" {
    # Short socket dir: macOS caps unix socket paths at ~104 chars.
    local sock_dir
    sock_dir="$(mktemp -d /tmp/bats-tmux.XXXXXX)"
    run env TMUX_TMPDIR="$sock_dir" \
        tmux -L bats -f /dev/null start-server \; source-file -n "$HOME/.tmux.conf"
    rm -rf "$sock_dir"
    assert_success
}

# ── Shell ─────────────────────────────────────────────────────────────────────

@test "[shell] ~/.zshrc adds ~/bin to PATH" {
    # shellcheck disable=SC2016  # single quotes are intentional; regex passed to grep
    run grep -Eq 'PATH=.*~\/bin|PATH=.*\$HOME\/bin' "$HOME/.zshrc"
    assert_success
}

@test "[shell] ~/.config directory exists" {
    assert_dir_exists "$HOME/.config"
}

@test "[shell] ~/.zshrc has valid zsh syntax" {
    run zsh -n "$HOME/.zshrc"
    assert_success
}
