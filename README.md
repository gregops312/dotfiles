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

## Work setup

There is an ignored `work` directory that contains work-specific configuration files.
These are not included in the public repository for security reasons.

```bash
$ tree work
work
├── bin
│   ├── aws-login
│   └── example
├── zsh-functions
│   ├── aws-login
│   └── example
└── zshrc
```
