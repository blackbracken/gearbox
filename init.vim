"dein Scripts-----------------------------
if &compatible
  set nocompatible               " Be iMproved
endif

" Required:
set runtimepath+=/home/master/.cache/dein/repos/github.com/Shougo/dein.vim

" Required:
if dein#load_state('/home/master/.cache/dein')
  call dein#begin('/home/master/.cache/dein')

  " Let dein manage dein
  " Required:
  call dein#add('/home/master/.cache/dein/repos/github.com/Shougo/dein.vim')

  " Add or remove your plugins here like this:
  call dein#add('Shougo/neosnippet.vim')
  call dein#add('Shougo/neosnippet-snippets')
  call dein#add('Shougo/deoplete.nvim')
  " call dein#add('scrooloose/nerdtree')
  call dein#add('vim-airline/vim-airline')
  call dein#add('airblade/vim-gitgutter')

  " Required:
  call dein#end()
  call dein#save_state()
endif

" Required:
filetype plugin indent on
syntax enable

" If you want to install not installed plugins on startup.
if dein#check_install()
  call dein#install()
endif

" For deoplete
let g:deoplete#enable_at_startup = 1

"End dein Scripts-------------------------

" display setting
set number
set cursorline
set title
set showmatch

" colorscheme
colorscheme gruvbox
set background=dark
set t_Co=256

" search setting
set ignorecase
set smartcase
set wrapscan
set hls
set incsearch
set inccommand=split

" indent setting
set autoindent
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set smarttab

" cache setting
set noswapfile
set nobackup

" encode setting
set encoding=utf-8
set fileencoding=utf-8

" external setting
set clipboard=unnamed
set mouse=a
