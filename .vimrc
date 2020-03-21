" vim:foldmethod=marker:foldlevel=0
" Set compatibility to Vim only.
set nocompatible
filetype plugin indent on

"" Plugins {{{
call plug#begin('~/.vim/plugged')

" Airline
Plug 'vim-airline/vim-airline' "powerline plugin
Plug 'vim-airline/vim-airline-themes'
" Gruvbox colorscheme
Plug 'morhetz/gruvbox'
" Better Markdown
Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'
"Fugitive Vim Github Wrapper
Plug 'tpope/vim-fugitive'
Plug 'git://github.com/sjl/gundo.vim' " graphical tree undo
Plug 'morhetz/gruvbox' " alternate colors
Plug 'vim-voom/VOoM' " outliner
Plug 'tpope/vim-commentary' " Comment manager/toggle
Plug 'tpope/vim-surround' "  surround text with whatever
Plug 'mhinz/vim-startify' " session manager and startup screen
Plug 'junegunn/goyo.vim' " writeroom style writing
Plug 'jceb/vim-orgmode' " org mode for vim
Plug 'tpope/vim-speeddating' " date adjustment for orgmode 

call plug#end()

""}}}
"" Plugin Settings {{{

"Disable folding for markdown files
let g:vim_markdown_folding_disabled = 1

"Voom settings
let g:voom_tree_width = 40
let g:voom_default_mode = 'markdown'
"" }}}
"" General Settings {{{

set modelines=1 "allow modelines

"more characters will be sent to the screen for redrawing
set ttyfast
set lazyredraw " avoid scrolling problem

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
" turn off search highlight
nnoremap <leader><space> :nohlsearch<CR>

" keep cursor in middle of screen
set scrolloff=999

set spell spelllang=en_us " spelling 

" Move to next line when using left and right
set whichwrap+=<,>
" |nojoinspaces| allows you to use SHIFT-J in normal mode to join the next line with the current line without adding unwanted spaces.
setlocal nojoinspaces

set tabstop=4       " number of visual spaces per TAB
set softtabstop=4   " number of spaces in tab when editing
set expandtab       " tabs are spaces


"" }}}
"" Keybindings & Mappings {{{


" set leader and local leader
let mapleader = "\<Space>"
let maplocalleader = ","

inoremap jk <esc>  "jk to escape

" Let's make it easy to edit this file (mnemonic for the key sequence is 'e'dit 'v'imrc)
nnoremap <leader>ev :e $MYVIMRC<cr>
" And to source this file as well (mnemonic for the key sequence is 's'ource 'v'imrc)
nnoremap <leader>sv :so $MYVIMRC<cr>
" Goto zshrc
nnoremap <leader>ez :vsp ~/.zshrc<CR>

"Toggle Goyo on/off
nnoremap <leader>w :Goyo<CR>

" toggle ranger file navigator
nnoremap <leader>fr :!ranger<CR>

" Quick save
nnoremap <leader>w :w!<CR>

" Quick quit
nnoremap <leader>q :q<CR>

"Copy to system clipboard
nmap <F2> :set paste<CR>:r !pbpaste<CR>:set nopaste<CR>
imap <F2> <Esc>:set paste<CR>:r !pbpaste<CR>:set nopaste<CR>
nmap <F1> :.w !pbcopy<CR><CR>
vmap <F1> :w !pbcopy<CR><CR>

" start external shell command with a bang
nnoremap ! :!

" correct common misspellings for commands
cabbrev ew :wq
cabbrev qw :wq 
cabbrev Q :q
cabbrev W :w 

" The Silver Searcher
if executable('ag')
	  " Use ag over grep
	    set grepprg=ag\ --nogroup\ --nocolor
endif

" bind K to grep word under cursor
nnoremap <leader>sg :grep! "\b<C-R><C-W>\b"<CR>:cw<CR>
" Ag exec command
"command -nargs=+ -complete=file -bar Ag silent! grep! <args>|cwindow|redraw!
nnoremap <leader>sa :Ag<Space>

" Toggle Voom
nnoremap <localLeader>v :VoomToggle<CR>

" highlight last inserted text
nnoremap gV `[v`]

" move vertically by visual line
nnoremap j gj
nnoremap k gk

"" }}}
"" Functions {{{

"" }}}
"" Themes & Colors {{{
" colorscheme settings
set background=dark
colorscheme gruvbox
"" }}}
"" Airline Settings {{{

"  let g:airline_powerline_fonts=1 
  let g:airline_theme = 'gruvbox'
" enable/disable detection of whitespace errors. >
  let g:airline#extensions#whitespace#enabled = 0
" enable buffers in tabs
  let g:airline#extensions#tabline#enabled = 1
" Tabline separators
  let g:airline#extensions#tabline#left_sep = '▶'
  let g:airline#extensions#tabline#left_alt_sep = '>'
" display tab number in tab
  let g:airline#extensions#tabline#tab_nr_type = 1 " tab number
" go to tab number with <leader>number
  let g:airline#extensions#tabline#buffer_idx_mode = 1
  nmap <leader>1 <Plug>AirlineSelectTab1
  nmap <leader>2 <Plug>AirlineSelectTab2
  nmap <leader>3 <Plug>AirlineSelectTab3
  nmap <leader>4 <Plug>AirlineSelectTab4
  nmap <leader>5 <Plug>AirlineSelectTab5
  nmap <leader>6 <Plug>AirlineSelectTab6
  nmap <leader>7 <Plug>AirlineSelectTab7
  nmap <leader>8 <Plug>AirlineSelectTab8
  nmap <leader>9 <Plug>AirlineSelectTab9
" display only filename in tabs
let g:airline#extensions#tabline#fnamemod = ':t'

"disable spell detection
let g:airline_detect_spell=0
let g:airline_detect_spelllang=0

" display time
function! AirlineInit()
"  let g:airline_section_y = airline#section#create(['ffenc', '%{strftime("%H:%M")}'])
"  let g:airline_section_y = airline#section#create(['%{strftime("%a  %b %d  %X")}'])
  let g:airline_section_y = airline#section#create(['%{strftime("%b %d %X")}'])
endfunction

" Modes
let g:airline_mode_map = {
    \ '__'     : '-',
    \ 'c'      : 'C',
    \ 'i'      : 'I',
    \ 'ic'     : 'I',
    \ 'ix'     : 'I',
    \ 'n'      : 'N',
    \ 'multi'  : 'M',
    \ 'ni'     : 'N',
    \ 'no'     : 'N',
    \ 'R'      : 'R',
    \ 'Rv'     : 'R',
    \ 's'      : 'S',
    \ 'S'      : 'S',
    \ ''     : 'S',
    \ 't'      : 'T',
    \ 'v'      : 'V',
    \ 'V'      : 'V',
    \ ''     : 'V',
    \ }

" symbol dictionary
if !exists('g:airline_symbols')
   let g:airline_symbols = {}
endif

"" unicode symbols

    let g:airline_left_sep = '»'
    let g:airline_left_sep = '▶'
    let g:airline_right_sep = '«'
    let g:airline_right_sep = '◀'
    let g:airline_symbols.linenr = '␊'
    let g:airline_symbols.linenr = '␤'
    let g:airline_symbols.linenr = '¶'
    let g:airline_symbols.branch = '⎇'
    let g:airline_symbols.paste = 'ρ'
    let g:airline_symbols.paste = 'Þ'
    let g:airline_symbols.paste = '∥'
    let g:airline_symbols.whitespace = 'Ξ'

autocmd VimEnter * call AirlineInit()

""}}}
"" Backups {{{
set backup
set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set backupskip=/tmp/*,/private/tmp/*
set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set writebackup
"" }}}
