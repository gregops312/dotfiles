# Config Usage

## Overview
This will explain what my configs do and how to use them

	.bash_profile
	.tmux.conf
	.vimrc
	.zshrc
	greg-kman.zsh-theme

0. Clone the repository
    * <http://>

2. Run loader.sh will
	* cp .bash_profile ~/
	* cp .tmux_conf ~/
	* cp .vimrc ~/
	* cp .zshrc ~/
	* greg-kman.zsh-theme ~/.oh-my-zsh/themes
	
| Features | Bash Profile | Tmux | Vim | ZSH |
| :------: | :----------: | :--: | :-: | :-: |
| yes | asdf | asafd | dfg | gsfdd |



## SSH key auth setup
copy key to server with
```
scp ~/.ssh/id_rsa.pub user@server:~/.ssh/authorized_keys
```

logon to server and change permissions
```chmod 700 ~/.ssh```

```chmod 640 ~/.ssh/authorized_keys```


