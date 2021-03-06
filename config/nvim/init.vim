syntax enable
call plug#begin('~/.local/share/nvim/plugged')
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'airblade/vim-gitgutter'         " See git changes in realtime
Plug 'bfontaine/Brewfile.vim'         " Syntax for Brewfile
Plug 'christoomey/vim-tmux-navigator' " Use <c-h> between vim and tmux
Plug 'ctrlpvim/ctrlp.vim'             " Fuzzy file finder
Plug 'editorconfig/editorconfig-vim'  " .editorconfig integration
Plug 'elmcast/elm-vim'                " Elm integration
Plug 'godlygeek/tabular'              " Columnar layouts
Plug 'itspriddle/vim-marked'          " Use Marked 2 for Markdown
Plug 'janko-m/vim-test'               " Let's test!
Plug 'mattn/emmet-vim'                " HTML magic
Plug 'mattn/gist-vim'                 " Manipulate Gist files
Plug 'mattn/webapi-vim'               " Dependency for gist-vim
Plug 'mhinz/vim-mix-format'
Plug 'morhetz/gruvbox'                " Gruvbox colorscheme
Plug 'pbogut/deoplete-elm'            " Elm completion
Plug 'pbrisbin/vim-mkdir'             " Automake nonexistent dirs
Plug 'powerman/vim-plugin-AnsiEsc'    " ANSI escape codes in docs
Plug 'sheerun/vim-polyglot'           " Multi-language integration
Plug 'slashmili/alchemist.vim'        " Elixir omnibus plugin
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
Plug 'w0rp/ale'                       " Asynchronous linting engine
call plug#end()

" The Silver Searcher
if executable('ag')
  " Use ag over grep
  set grepprg=ag\ --nogroup\ --nocolor

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

  " ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0
endif

let g:alchemist_tag_disable = 1     " Use deoplete for tab completion
let g:ale_fix_on_save = 1
let g:ale_fixers = {
\  'haskell': [
\    'brittany',
\    'hfmt',
\    'remove_trailing_lines',
\    'trim_whitespace'
\  ],
\}
let g:deoplete#enable_at_startup = 1
let g:marked_app = "Marked 2"
let g:polyglot_disabled = ['elm']
let test#strategy = {
  \ 'nearest': 'neovim',
  \ 'file':    'neovim',
  \ 'suite':   'basic',
\}

let mapleader=" "

inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"

nnoremap <cr> :nohls<cr>
nnoremap <leader><leader> <c-^>
nnoremap <leader>so :so %<cr>
nnoremap <leader>tf :TestFile<cr>
nnoremap <leader>tl :TestLast<cr>
nnoremap <leader>tn :TestNearest<cr>
nnoremap <leader>ts :TestSuite<cr>
nnoremap <leader>vi :tabe ~/.config/nvim/init.vim<cr>
nnoremap K :grep! "\b<C-R><C-W>\b"<CR>:cw<CR>

tmap <C-o> <C-\><C-n>

set background=dark
set encoding=utf-8
set expandtab
set hidden
set hlsearch
set ignorecase
set incsearch
set noswapfile
set number
set shiftwidth=2
set smartcase
set softtabstop=2
set splitbelow
set splitright
set tabstop=2
set title

colo gruvbox
