" vim:fdm=marker
" Set compatibility to Vim only.
set nocompatible


"" Plugins {{{
call plug#begin('~/.vim/plugged')

" Gruvbox colorscheme
Plug 'morhetz/gruvbox'
" Better Markdown
Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'
"Fugitive Vim Github Wrapper
Plug 'tpope/vim-fugitive'
Plug 'git://github.com/sjl/gundo.vim' " graphical tree undo
Plug 'morhetz/gruvbox' " alternate colors
" Plug 'VOoM' " outliner
Plug 'tpope/vim-commentary' " Comment manager/toggle
Plug 'tpope/vim-surround' "  surround text with whatever
Plug 'mhinz/vim-startify' " session manager and startup screen
Plug 'junegunn/goyo.vim' " writeroom style writing
" Plug 'vim-orgmode' " org mode for vim

call plug#end()

""}}}
"" Plugin Settings {{{

"Disable folding for markdown files
let g:vim_markdown_folding_disabled = 1

"" }}}
"" General Settings {{{

"more characters will be sent to the screen for redrawing
set ttyfast

"time waited for key press(es) to complete. It makes for a faster key response
set ttimeout
set ttimeoutlen=50

"make backspace behave properly in insert mode
set backspace=indent,eol,start

"display incomplete commands
set showcmd

"a better menu in command mode
set wildmenu
set wildmode=longest:full,full

"hide buffers instead of closing them even if they contain unwritten changes
set hidden

"enable soft wrap for lines
set wrap

"always display the status line
set laststatus=2
"modifiedflag, charcount, filepercent, filepath
set statusline=%=%m\ %c\ %P\ %f

"display line numbers on the left side
set number

""highlight current line
set cursorline

"display text width column
"set colorcolumn=81

""new splits will be at the bottom or to the right side of the screen
set splitbelow
set splitright

"always set autoindenting on
set autoindent

"incremental search
set incsearch
"highlight search
set hlsearch
"searches are case insensitive unless they contain at least one capital letter
set ignorecase
set smartcase

"" }}}
"" Keybindings & Mappings {{{


"" }}}
"" Functions {{{

"" }}}
"" Themes & Colors {{{
" colorscheme settings
set background=dark
colorscheme gruvbox
"" }}}


