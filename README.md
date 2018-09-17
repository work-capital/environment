Dependencies
============


To solve the high CPU issue in macbooks see: 

https://askubuntu.com/questions/444005/what-is-causing-ubuntu-on-macbook-pro-to-have-high-cpu-usage

https://askubuntu.com/questions/176565/why-does-kworker-cpu-usage-get-so-high/233947#233947

### wifi

Install the broadcom-sta-dkms, but before, add to packages
/etc/apt/sources.list
```
deb http://ftp.de.debian.org/debian jessie-backports main non-free
```

### tmux

You can test it by creating a background/daemonized tmux session named $SESSION like so : 

tmux new-session -d -s $SESSION 
you can monitor this session in another terminal by using : 

tmux attach-session -t $SESSION 
and then using this command from the "non tmux" terminal 

tmux send-keys -t $SESSION:0.42 
and then if the pane 42 doesnt exist, tmux will complain. 

Now by using a test string, like so : 

tmux send-keys -t $SESSION:0.42 "test" C-m 
You can pinpoint the exact pane interactively if you don't know the exact pane number that you want. 

On a side note, you can display pane numbers inside a tmux session by entering (listed in the key bindings session of the documentation you linked) 

    C-b q           Briefly display pane indexes.



### java

https://www.digitalocean.com/community/tutorials/how-to-install-java-on-ubuntu-with-apt-get 

### sudo

If you want to permantelly allow sudo:

```
su
visudo
```

and add this line:
```
your_user_name ALL = NOPASSWD: ALL



Install NeoVIM

```
apt-get install jq vim neovim git gcc w3m tmux
```

o run the scripts
```
chmod 777 install.sh
chmod 777 clean.sh
```

## i3

to fix resolution on hidpi monitors, create a file on home dir ~/.Xresources
with: 

```
! Fonts {{{
Xft.antialias: true
Xft.hinting:   true
Xft.rgba:      rgb
Xft.hintstyle: hintfull
Xft.dpi:       140
! }}}
```
or see:

```
https://unix.stackexchange.com/questions/267885/how-do-i-scale-i3-window-manager-for-my-hidpi-display
```



## Vi
Install neovim before setup the dotfiles

Copy manually the color schemas from https://github.com/rakr/vim-one to 
~/.config/nvim/colors directory, and pay attention to the tmux configuration 
to support true colors.


## Elixir

[vimix](https://github.com/spiegela/vimix)

Install
=======

You have to go to the ./environment directory before.
after installing, do 
http://askubuntu.com/questions/131823/cant-make-zsh-the-default-shell 

```
su user
chsh -s $(which zsh)
```

In zshrc file, we make an alias vi = nvim


After installing, install all plug-ins in VIM
```
:PlugInstall
```

### idris

```
sudo apt install haskell-platform
sudo apt install libncurses5-dev
mkdir Idris
cd Idris
cabal update
cabal sandbox init
cabal install idris
```

### git

For more aliases:
https://gist.github.com/pksunkara/988716

## synergy 
https://toic.org/blog/2009/secure-synergy-setup/ 

ssh -N -f -L 24800:localhost:24800 branko@192.168.0.100


## boot
http://stackoverflow.com/questions/12973777/how-to-run-a-shell-script-at-startup 



See [here](https://xaizek.github.io/2016-08-13/big-list-of-vim-like-software/)
for more VI-like applications

# ONE SCHEME

Clone 'one' color scheme and save the one.vim file into the .config/nvim/colors
folder


# UPDATE NEOPLETE
Install python support for vim, see doc in the link below: 


https://github.com/Shougo/deoplete.nvim
