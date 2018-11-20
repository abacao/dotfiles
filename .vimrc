set nocompatible
set relativenumber

colorscheme darkblue 

syntax enable

" ================ General Config ====================

set number                      "Line numbers are good
set backspace=indent,eol,start  "Allow backspace in insert mode
set history=1000                "Store lots of :cmdline history
set showcmd                     "Show incomplete cmds down the bottom
set showmode                    "Show current mode down the bottom
set visualbell                  "No sounds
set autoread                    "Reload files changed outside vim

set shell=bash
set showmatch
set hlsearch
set incsearch
set mouse=a
set shortmess+=I
set clipboard=unnamed
set ttyfast
set encoding=utf-8
set laststatus=2
set cmdheight=2
set wildmenu
set wildmode=list:full
set title

" ================ Turn Off Swap Files ==============

set noswapfile
set nobackup
set nowb

" ================ Indentation ======================

set autoindent
set smartindent
set smarttab
set autoread
set shiftwidth=2
set softtabstop=2
set tabstop=2
set expandtab

" Capital W to write without sudo
command W :execute ':silent w !sudo tee % > /dev/null' | :edit!

call plug#begin()

  Plug 'scrooloose/nerdtree'
  Plug 'Xuyuanp/nerdtree-git-plugin'
  Plug 'bling/vim-airline'

call plug#end()

map <C-o> :NERDTreeToggle<CR>

