#!/bin/sh
echo "installing vim-plug"
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
echo "cp vimrc"
mkdir -p ~/.vim/.undo/
mkdir -p ~/.vim/.backup/
mkdir -p ~/.vim/.swp/
cp vimrc ~/.vimrc
echo "done"
echo "now open vim and type :PlugInstall"
