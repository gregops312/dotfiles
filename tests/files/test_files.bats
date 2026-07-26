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

# ── Hard links ────────────────────────────────────────────────────────────────

@test "[links] gitconfig is hard-linked to ~/.gitconfig" {
    assert_file_exists "$HOME/.gitconfig"
    assert_equal "$(get_inode conf/gitconfig)" "$(get_inode "$HOME/.gitconfig")"
}

@test "[links] vimrc is hard-linked to ~/.vimrc" {
    assert_file_exists "$HOME/.vimrc"
    assert_equal "$(get_inode conf/vimrc)" "$(get_inode "$HOME/.vimrc")"
}

@test "[links] tmux.conf is hard-linked to ~/.tmux.conf" {
    assert_file_exists "$HOME/.tmux.conf"
    assert_equal "$(get_inode conf/tmux.conf)" "$(get_inode "$HOME/.tmux.conf")"
}

@test "[links] zshrc is hard-linked to ~/.zshrc" {
    assert_file_exists "$HOME/.zshrc"
    assert_equal "$(get_inode conf/zshrc)" "$(get_inode "$HOME/.zshrc")"
}

@test "[links] starship.toml is hard-linked to ~/.config/starship.toml" {
    assert_file_exists "$HOME/.config/starship.toml"
    assert_equal "$(get_inode conf/starship.toml)" "$(get_inode "$HOME/.config/starship.toml")"
}

@test "[links] greg-kman theme is hard-linked into oh-my-zsh themes" {
    assert_file_exists "$HOME/.oh-my-zsh/themes/greg-kman.zsh-theme"
    assert_equal "$(get_inode conf/greg-kman.zsh-theme)" "$(get_inode "$HOME/.oh-my-zsh/themes/greg-kman.zsh-theme")"
}

# ── Symlink ───────────────────────────────────────────────────────────────────

@test "[links] bin/ is symlinked to ~/bin" {
    assert_link_exists "$HOME/bin"
    assert_equal "$(readlink "$HOME/bin")" "${DOTFILES_ROOT}/bin"
}

# ── Installed tools ───────────────────────────────────────────────────────────

@test "[tools] oh-my-zsh is installed" {
    assert_dir_exists "$HOME/.oh-my-zsh"
}

@test "[tools] starship is on PATH" {
    run command -v starship
    assert_success
}

@test "[tools] vundle is installed" {
    assert_dir_exists "$HOME/.vim/bundle/Vundle.vim"
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
