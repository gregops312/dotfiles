# Dotfiles

```bash
./install
```

## TODO

Note that gnu utils should be mapped to real ones on mac
https://apple.stackexchange.com/questions/69223/how-to-replace-mac-os-x-utilities-with-gnu-core-utilities

https://www.google.com/search?sxsrf=ALeKk02KoQ1WZjUbBc1cNpaoTJ1h8hfmwQ%3A1587699605477&ei=lV-iXuzLHJDRtAaRqqPIBg&q=bash+named+arguments&oq=bash+named+&gs_lcp=CgZwc3ktYWIQAxgAMgcIABAUEIcCMgIIADICCAAyAggAMgIIADICCAAyAggAOgQIABBHOgQIIxAnOgQIABBDOgUIABCDAVC9XFj2cmD3fGgBcAJ4AIABrAKIAYIMkgEHNS40LjEuMZgBAKABAaoBB2d3cy13aXo&sclient=psy-ab

* https://github.com/pd/dotfiles/blob/master/Brewfile
* https://github.com/pd/dotfiles/blob/master/gitconfig
* https://github.com/pd/dotfiles/blob/master/zshrc
* https://github.com/pd/homebrew-brewfile/blob/master/Brewfile


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
