call plug#begin('~/.local/share/nvim/plugged')
Plug 'c-brenn/phoenix.vim'            " Phoenix navigation (depends on projectionist)
Plug 'christoomey/vim-tmux-navigator' " Use <c-h> between vim and tmux
Plug 'ctrlpvim/ctrlp.vim'             " Fuzzy file finder
Plug 'editorconfig/editorconfig-vim'  " .editorconfig integration
Plug 'elmcast/elm-vim'                " Elm integration
Plug 'godlygeek/tabular'              " Columnar layouts
Plug 'itspriddle/vim-marked'          " Use Marked 2 for Markdown
  let g:marked_app = "Marked 2"
Plug 'janko-m/vim-test'               " Let's test!
  nnoremap <leader>t :TestNearest<cr>
  nnoremap <leader>T :TestFile<cr>
  nnoremap <leader>a :TestSuite<cr>
  nnoremap <leader>l :TestLast<cr>
Plug 'mattn/emmet-vim'                " HTML magic
Plug 'mattn/gist-vim'                 " Manipulate Gist files
Plug 'mattn/webapi-vim'               " Dependency for gist-vim
Plug 'mhinz/vim-mix-format'           " Elixir formatting
  let g:mix_format_on_save = 1
Plug 'morhetz/gruvbox'                " Gruvbox colorscheme
Plug 'neomake/neomake'
  augroup localneomake
    autocmd! BufReadPost,BufWritePost * Neomake
  augroup end
  let g:neomake_markdown_enabled_makers = []
  let g:neomake_elixir_enabled_makers = ['mix', 'credo']
Plug 'pbogut/deoplete-elm'            " Elm deoplete completion
Plug 'powerman/vim-plugin-AnsiEsc'    " ANSI escape codes in docs
Plug 'sheerun/vim-polyglot'           " Multi-language integration
  let g:polyglot_disabled = ['elm']
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
  let g:deoplete#enable_at_startup = 1
  inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"
Plug 'slashmili/alchemist.vim'        " Elixir omnibus plugin
  let g:alchemist_tag_disable = 1     " Use deoplete for tab completion
Plug 'tpope/vim-capslock'             " Software capslock with <c-g>c
Plug 'tpope/vim-commentary'           " Comment code
Plug 'tpope/vim-dispatch'             " Async compiling and testing
Plug 'tpope/vim-endwise'              " Add `end` automatically
Plug 'tpope/vim-eunuch'               " Unix commands
Plug 'tpope/vim-fugitive'             " Git integration
Plug 'tpope/vim-projectionist'        " Navigation help for IDE-like functions
Plug 'tpope/vim-ragtag'               " Add closing tags
Plug 'tpope/vim-surround'             " Surround stuff
Plug 'tpope/vim-tbone'                " Use :Tmux commands
Plug 'tpope/vim-unimpaired'           " Lots of cool tricks
Plug 'tpope/vim-vinegar'              " Netrw enhancements
Plug 'vim-airline/vim-airline'        " Pretty status bar
call plug#end()

colo gruvbox
let mapleader=" "
nnoremap <cr> :nohls<cr>
nnoremap <leader>so :so %<cr>
nnoremap <leader>vi :tabe ~/.config/nvim/init.vim<cr>
nnoremap <leader><leader> <c-^>
set background=dark
set cursorcolumn
set cursorline
set encoding=utf-8
set expandtab
set hlsearch
set ignorecase
set incsearch
set number
set shiftwidth=2
set smartcase
set softtabstop=2
set tabstop=2
set title
syntax enable
