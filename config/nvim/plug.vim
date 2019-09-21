if empty(glob('~/.local/share/nvim/site/autoload/plug.vim'))
  silent !curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source ~/.config/nvim/init.vim
endif

call plug#begin('~/.vim/plugged')
  Plug 'neoclide/coc.nvim', {'branch': 'release'}
  Plug 'rhysd/vim-color-spring-night'
  Plug 'scrooloose/nerdtree'
  Plug 'itchyny/lightline.vim'
  Plug 'Yggdroot/indentLine'
  Plug 'udalov/kotlin-vim', {'for':['kotlin']}
  Plug 'elzr/vim-json', {'for':['json']}
  Plug 'airblade/vim-gitgutter'
call plug#end()
