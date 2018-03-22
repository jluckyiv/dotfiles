" Specify a directory for plugins
" - For Neovim: ~/.local/share/nvim/plugged
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')

if !has('nvim')
  Plug 'tpope/vim-sensible'             " Sensible Vim defaults, unnecessary with dotfiles
endif

if has('nvim')

  Plug 'neomake/neomake'
  " Run NeoMake on read and write operations
  autocmd! BufReadPost,BufWritePost * Neomake
endif

Plug 'christoomey/vim-tmux-navigator' " Use <c-h> between vim and tmux
Plug 'editorconfig/editorconfig-vim'  " .editorconfig integration
Plug 'godlygeek/tabular'              " Columnar layouts
Plug 'itspriddle/vim-marked'
let g:marked_app = "Marked 2"
Plug 'mattn/emmet-vim'
Plug 'mattn/gist-vim'
Plug 'mattn/webapi-vim'               " Dependency for gist-vim
Plug 'morhetz/gruvbox'                " gruvbox
Plug 'tpope/vim-capslock'             " Software capslock with <c-g>c
Plug 'tpope/vim-dispatch'             " Async compiling and testing
Plug 'tpope/vim-ragtag'
Plug 'tpope/vim-tbone'                " Use :Tmux commands
Plug 'tpope/vim-unimpaired'           " Lots of cool tricks
Plug 'tpope/vim-vinegar'              " Netrw enhancements
Plug 'vim-airline/vim-airline'        " Pretty status bar

call plug#end()

set background=dark
colo gruvbox
