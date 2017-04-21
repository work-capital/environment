Dependencies
============

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

To run the scripts
```
chmod 777 install.sh
chmod 777 clean.sh
```




## Vi
Install neovim before setup the dotfiles


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
