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

# ── Symlinks (from config.yaml) ───────────────────────────────────────────────

@test "[links] bin/ is symlinked to ~/bin" {
     assert_link_exists "$HOME/bin"
     assert_equal "$(readlink "$HOME/bin")" "${DOTFILES_ROOT}/bin"
 }

@test "[links] gitconfig is symlinked to ~/.gitconfig" {
    assert_link_exists "$HOME/.gitconfig"
    assert_equal "$(readlink "$HOME/.gitconfig")" "${DOTFILES_ROOT}/conf/gitconfig"
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

# ── Configs ───────────────────────────────────────────────────────────────────

@test "[config] helix config file is present under ~/.config/helix" {
    # NOTE: source file is named 'config..toml' (two dots) in conf/helix/.
    # Helix looks for 'config.toml' — this test reflects the deployed state.
    assert_file_exists "$HOME/.config/helix/config.toml"
}

@test "[config] helix languages.toml is present under ~/.config/helix" {
    assert_file_exists "$HOME/.config/helix/languages.toml"
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
