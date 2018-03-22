call plug#begin('~/.local/share/nvim/plugged')
Plug 'christoomey/vim-tmux-navigator' " Use <c-h> between vim and tmux
Plug 'editorconfig/editorconfig-vim'  " .editorconfig integration
Plug 'godlygeek/tabular'              " Columnar layouts
Plug 'itspriddle/vim-marked'          " Use Marked 2 for Markdown
Plug 'mattn/emmet-vim'                " HTML magic
Plug 'mattn/gist-vim'                 " Manipulate Gist files
Plug 'mattn/webapi-vim'               " Dependency for gist-vim
Plug 'morhetz/gruvbox'                " Gruvbox colorscheme
Plug 'neomake/neomake'
Plug 'tpope/vim-capslock'             " Software capslock with <c-g>c
Plug 'tpope/vim-commentary'           " Comment code
Plug 'tpope/vim-dispatch'             " Async compiling and testing
Plug 'tpope/vim-endwise'              " Add `end` automatically
Plug 'tpope/vim-eunuch'               " Unix commands
Plug 'tpope/vim-fugitive'             " Git integration
Plug 'tpope/vim-markdown'             " Markdown integration
Plug 'tpope/vim-projectionist'        " Navigation help for IDE-like functions
Plug 'tpope/vim-ragtag'               " Add closing tags
Plug 'tpope/vim-surround'             " Surround stuff
Plug 'tpope/vim-tbone'                " Use :Tmux commands
Plug 'tpope/vim-unimpaired'           " Lots of cool tricks
Plug 'tpope/vim-vinegar'              " Netrw enhancements
Plug 'vim-airline/vim-airline'        " Pretty status bar
call plug#end()

autocmd! BufReadPost,BufWritePost * Neomake
colo gruvbox
let g:marked_app = "Marked 2"
let mapleader=" "
nnoremap <cr> :nohls<cr>
nnoremap <leader>vi :tabe ~/.config/nvim/init.vim<cr>
nnoremap <leader>so :so ~/.config/nvim/init.vim<cr>
set background=dark
set number
