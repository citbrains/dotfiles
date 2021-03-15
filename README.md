# dotfiles

## Install
### clone
```bash
$ git clone -b JetPack4_3 https://github.com/citbrains/dotfiles.git ~/dotfiles
```
### Create a symbolic links
```bash
$ ln -s ~/dotfiles/bashrc ~/.bashrc
$ ln -s ~/dotfiles/vimrc ~/.vimrc
$ ln -s ~/dotfiles/tmux.conf ~/.tmux.conf
```

### Scripts services install
```
$ sudo ln -s ~/dotfiles/scripts/services/autostartup.service /etc/systemd/system
$ sudo ln -s ~/dotfiles/scripts/services/gnome-terminal.service /etc/systemd/system
$ sudo ln -s ~/dotfiles/scripts/services/x11vnc.service /etc/systemd/system
$ sudo systemctl enable autostartup
$ sudo systemctl enable gnome-terminal
$ sudo systemctl enable x11vnc
```

## Create a darknet_path
```bash
$ vi /home/cit/darknet_path
```
darknet_path
```
/home/cit/darknet
```

## Resolution Without Real Monitor(Virtual 1650x950).
/etc/X11/xorg.conf
```
Section "Monitor"
   Identifier "DSI-0"
   Option    "Ignore"
EndSection

Section "Screen"
   Identifier    "Default Screen"
   Monitor        "Configured Monitor"
   Device        "Default Device"
   SubSection "Display"
       Depth    24
       Virtual 1650 950
   EndSubSection
EndSection
```
https://devtalk.nvidia.com/default/topic/995621/jetson-tx1/jetson-tx1-desktop-sharing-resolution-problem-without-real-monitor/post/5159559/#5159559
