#!/bin/sh
pacman -S vim git
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
mkdir ~/.vim/.undo/
mkdir ~/.vim/.backup/
mkdir ~/.vim/.swp//
cp ../vimrc ~/.vimrc
