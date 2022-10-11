" Use Vim settings, rather than Vi settings.
" This must be first, because it changes other options as a side effect.
set nocompatible

" Make backspace behave in a sane manner.
set backspace=indent,eol,start

"Switch syntax highlighting on.
syntax on

" indent settings
set autoindent
set smartindent

" tab settings
" Set 'tabstop' and 'shiftwidth' to whatever you prefer and use 'expandtab'.
" This way you will always insert spaces.
set tabstop=2
set shiftwidth=2
set expandtab
set smarttab

" indent settings
set smartindent

" Enable file type detection and do language-dependent indenting.
filetype plugin indent on

" Show relative line number
set relativenumber

" Allow hidden buffers, don't limit to 1 file per window/split.
set hidden

" Show filename on the window title. 
set title

" Colors
colorscheme ron 
hi LineNr ctermfg=DarkGrey

" Miscs
set hlsearch
set belloff=all 

