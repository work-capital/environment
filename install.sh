#!/bin/bash
# setup-dotfiles
#
# Author: Henry Hazan <github.com/henry-hz> 2016

LINKED_FILES=("tmux.conf" "vimrc" "zshrc")

function main() {
  for i in ${LINKED_FILES[@]} ; do
    ln -s "$HOME/dotfiles/$i" "$HOME/.$i"
  done
  setup_vim
  setup_zsh
  setup_git
  setup_scripts
}

function setup_scripts() {
  mkdir -p $HOME/.scripts
  for i in $HOME/dotfiles/scripts/* ; do
    ln -s $i $HOME/.scripts/`basename $i`
  done
}

function setup_vim() {
  mkdir $HOME/.vim
  mkdir $HOME/.vim/backup
  mkdir $HOME/.vim/tmp
  curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
}

function setup_git() {
  ln -s $HOME/dotfiles/git/gitconfig $HOME/.gitconfig
  ln -s $HOME/dotfiles/git/gitignore $HOME/.gitignore
}

function setup_zsh() {
  git clone http://github.com/robbyrussell/oh-my-zsh.git $HOME/.oh-my-zsh
  echo "ym.zsh-theme" >> $HOME/.oh-my-zsh/.git/info/exclude
  ln -s $HOME/dotfiles/ym.zsh-theme $HOME/.oh-my-zsh/themes/ym.zsh-theme
}


main
