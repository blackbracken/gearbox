call plug#begin('~/.vim/plugged')
  " color displays
  Plug 'rhysd/vim-color-spring-night'
  Plug 'junegunn/vim-emoji'

  " hierarchy
  Plug 'scrooloose/nerdtree'

  " lines
  Plug 'itchyny/lightline.vim'
  Plug 'Yggdroot/indentLine'

  " highlights
  Plug 'udalov/kotlin-vim', {'for':['kotlin']}
  Plug 'elzr/vim-json', {'for':['json']}

  Plug 'airblade/vim-gitgutter'
call plug#end()

" local keybind
nnoremap <silent><A-1> :NERDTreeToggle<CR>

" colorscheme
colorscheme spring-night
let g:airline_theme = 'spring_night'
set termguicolors
set background=dark
set t_Co=256
autocmd ColorScheme * highlight Normal ctermbg=none
autocmd ColorScheme * highlight LineNr ctermbg=none

" emoji
set completefunc=emoji#complete

" display
set number
set cursorline
set title
set showmatch

" search
set ignorecase
set smartcase
set wrapscan
set hls
set incsearch
set inccommand=split

" indent
set autoindent
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set smarttab

" cache
set noswapfile
set nobackup

" encode
set encoding=utf-8
set fileencoding=utf-8

" external
set clipboard=unnamed
set mouse=a
