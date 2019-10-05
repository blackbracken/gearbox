if empty(glob('~/.local/share/nvim/site/autoload/plug.vim'))
  silent !curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source ~/.config/nvim/init.vim
endif

call plug#begin('~/.vim/plugged')
  Plug 'neoclide/coc.nvim', {'branch': 'release'}
  Plug 'cocopon/iceberg.vim'
  Plug 'scrooloose/nerdtree'
  Plug 'itchyny/lightline.vim'
  Plug 'airblade/vim-gitgutter'
call plug#end()

" display
colorscheme iceberg
let g:airline_theme = 'iceberg'
set t_Co=256
set number
set cursorline
set title
highlight Normal ctermbg=none
highlight NonText ctermbg=none
highlight LineNr ctermbg=none
highlight Folded ctermbg=none
highlight EndOfBuffer ctermbg=none 

" search
set ignorecase
set smartcase
set wrapscan
set hlsearch
set incsearch

" cache
set noswapfile
set nobackup

" default code formatting
set autoindent
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set smarttab

" encode
set encoding=utf-8
set fileencoding=utf-8

" etc
set clipboard=unnamed
set mouse=a

" key binds
nnoremap <silent><A-1> :NERDTreeToggle<CR>

autocmd BufNewFile,BufRead Makefile runtime! filetype/makefile.vim
