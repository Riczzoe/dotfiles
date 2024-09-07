call plug#begin('~/.vim/plugged')

Plug 'preservim/nerdtree'
Plug 'tomtom/tcomment_vim'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'github/copilot.vim'
Plug 'junegunn/fzf.vim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'lervag/vimtex'
Plug 'bfrg/vim-cpp-modern'

call plug#end()
