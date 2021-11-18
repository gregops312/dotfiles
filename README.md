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
