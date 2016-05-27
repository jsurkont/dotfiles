call plug#begin('~/.vim/plugged')

" NERD tree will be loaded on the first invocation of NERDTreeToggle command
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
" Jellybeans color scheme
Plug 'nanotech/jellybeans.vim'
" a syntax checking plugin for Vim that integrates with external syntax checkers to provide in-editor feedback on your code as you make changes
Plug 'scrooloose/syntastic'
" Autocompletion
Plug 'Valloric/YouCompleteMe', { 'for': ['c', 'cpp', 'perl', 'java', 'JavaScript'] }
" JSON support
Plug 'elzr/vim-json'
" JavaScript support
Plug 'pangloss/vim-javascript'
" Comments
Plug 'tpope/vim-commentary'
" Surround text with parentheses, brackets, quotes, XML tags, and more
Plug 'tpope/vim-surround'

" Add plugins to &runtimepath
call plug#end()
