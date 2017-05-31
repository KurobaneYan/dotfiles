set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'dracula/vim'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
call vundle#end()
filetype plugin indent on

" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal

syntax on
color dracula

set backup
set swapfile
set undodir=~/.vim/.undo//
set backupdir=~/.vim/.backup//
set directory=~/.vim/.swp//
set mouse=a
set history=300
set number
set relativenumber
set expandtab
set tabstop=2
set shiftwidth=2
set softtabstop=2
set laststatus=2
set autoindent
set smartindent
set colorcolumn=80

highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/
