#!/bin/bash
# setup environment
#
# Author: Henry Hazan <github.com/henry-hz> 2016

LINKED_FILES=("tmux.conf" "vimrc" "zshrc" "gitignore")

function main() {
  for i in ${LINKED_FILES[@]} ; do
    ln -s "$HOME/environment/$i" "$HOME/.$i"
  done
  setup_vim
  setup_zsh
  setup_git
  setup_scripts
}

function setup_scripts() {
  mkdir -p $HOME/.scripts
  for i in $HOME/environment/scripts/* ; do
    ln -s $i $HOME/.scripts/`basename $i`
  done
}

function setup_nvim() {
  mkdir $HOME/.config
  mkdir $HOME/.config/nvim
  ln -s $HOME/environment/init.vim $HOME/.config/nvim/init.vim
  curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
}

function setup_git() {
  ln -s $HOME/environment/git/gitconfig $HOME/.gitconfig
  ln -s $HOME/environment/git/gitignore $HOME/.gitignore
}

function setup_zsh() {
  git clone http://github.com/robbyrussell/oh-my-zsh.git $HOME/.oh-my-zsh
  echo "ym.zsh-theme" >> $HOME/.oh-my-zsh/.git/info/exclude
  ln -s $HOME/environment/ym.zsh-theme $HOME/.oh-my-zsh/themes/ym.zsh-theme
  #sudo chsh -s $(which zsh)
}


main
