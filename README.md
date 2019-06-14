# dotfiles

## Install
### clone
```bash
$ git clone https://github.com/citbrains/dotfiles.git ~
```
### Create a symbolic links
```bash
$ ln -s ~/dotfiles/bashrc ~/.bashrc
$ ln -s ~/dotfiles/vimrc ~/.vimrc
$ ln -s ~/dotfiles/tmux.conf ~/.tmux.conf
$ # VNC autostart
$ ln -s ~/dotfiles/config/autostart ~/.config/
```
### Script autostartup
rc.local
```
# Script autostartup
/home/cit/dotfiles/scripts/autostartup.sh
```
