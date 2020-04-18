# Dotfiles

```bash
./install
```

## SSH key auth setup

copy key to server with

```bash
scp ~/.ssh/id_rsa.pub user@server:~/.ssh/authorized_keys
```

logon to server and change permissions

```bash
chmod 700 ~/.ssh
chmod 640 ~/.ssh/authorized_keys
```

https://github.com/pd/dotfiles/blob/master/bin/filesizes
https://github.com/pd/dotfiles/blob/master/bin/git-delete-merged-branches
https://github.com/pd/dotfiles/blob/master/bin/ssh-list-hosts
https://github.com/pd/dotfiles/blob/master/shell_profile/core_aliases.sh
https://github.com/pd/dotfiles/blob/master/shell_profile/completion.sh
https://github.com/pd/dotfiles/blob/master/Brewfile
https://github.com/pd/dotfiles/blob/master/gitconfig
https://github.com/pd/dotfiles/blob/master/zshrc
https://github.com/pd/homebrew-brewfile/blob/master/Brewfile
