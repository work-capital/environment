#!/bin/bash

# git
git config --global user.email "henry@work.capital"
git config --global user.name  "Henry Hazan"

# vim
ln -sf `pwd`/vim/vimrc ~/.vimrc

# neo-vim
mkdir ~/.config
mkdir ~/.config/nvim
ln -sf `pwd`/neovim/init.vim ~/.config/nvim/init.vim

## liquidprompt
pushd ~
git clone https://github.com/nojhan/liquidprompt.git
source liquidprompt/liquidprompt
popd

# zsh
git clone http://github.com/robbyrussell/oh-my-zsh.git $HOME/.oh-my-zsh
ln -sf `pwd`/zsh/zshrc ~/.zshrc

# ack
#ln -sf `pwd`/ack/ackrc ~/.ackrc

# tmux
ln -sf `pwd`/tmux/tmux.conf ~/.tmux.conf

# synergy
#ln -sf `pwd`/synergy/synergy.conf ~/.synergy.conf

# git
ln -sf `pwd`/git/gitconfig ~/.gitconfig
ln -sf `pwd`/git/gitignore ~/.gitignore

# bins
mkdir -p ~/.bin
for i in `pwd`/bin/* ; do
  ln -s $i ~/.bin/`basename $i`
done

