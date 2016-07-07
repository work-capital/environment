#!/bin/bash

# git
git config --global user.email "henry@work.capital"
git config --global user.name  "Henry Hazan"

# vim
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
ln -sf `pwd`/vim/vimrc ~/.vimrc

# neo-vim
mkdir ~/.config/nvim
curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
ln -sf `pwd`/neovim/init.vim ~/.config/nvim/init.vim

## liquidprompt
mkdir ~/liquidprompt
git clone https://github.com/nojhan/liquidprompt.git $HOME/liquidprompt
source $HOME/liquidprompt/liquidprompt

# zsh
git clone http://github.com/robbyrussell/oh-my-zsh.git $HOME/.oh-my-zsh
ln -sf `pwd`/zsh/zshrc ~/.zshrc
#sudo chsh -s $(which zsh)



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
  echo $i
  ln -sf $i ~/.bin/`basename $i`
done

