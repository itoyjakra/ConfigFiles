" Vundle requirement
"
set nocompatible              " required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
"
" " alternatively, pass a path where Vundle should install plugins
" "call vundle#begin('~/some/path/here')
"
" " let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'
Plugin 'tpope/vim-repeat'
Plugin 'sjl/gundo.vim'
" Plugin 'Valloric/YouCompleteMe'
Plugin 'Gundo'
Plugin 'scrooloose/syntastic'
Plugin 'tpope/vim-fugitive'
Plugin 'scrooloose/nerdtree'
Plugin 'derekwyatt/vim-scala'
"
" " Add all your plugins here (note older versions of Vundle used Bundle instead of Plugin)
"
"
" " All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
"
"


if &term =~ "xterm\\|rxvt"
" use an orange cursor in insert mode
let &t_SI = "\<Esc>]12;orange\x7"
" use a red cursor otherwise
let &t_EI = "\<Esc>]12;red\x7"
silent !echo -ne "\033]12;red\007"
" reset cursor when vim exits
autocmd VimLeave * silent !echo -ne "\033]112\007"
" use \003]12;gray\007 for gnome-terminal
endif
if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif


" ==========================================================
" Basic Settings
" ==========================================================
syntax on                     " syntax highlighing
filetype on                   " try to detect filetypes
filetype plugin indent on     " enable loading indent file for filetype
set number                    " Display line numbers
set title                     " show title in console title bar
set wildmenu                  " Menu completion in command mode on <Tab>
set wildmode=full             " <Tab> cycles between all matching choices.


""" Moving Around/Editing

set cursorline              " have a line indicate the cursor location
set ruler                   " show the cursor position all the time
set nostartofline           " Avoid moving cursor to BOL when jumping around
set scrolloff=3             " Keep 3 context lines above and below the cursor
set showmatch               " Briefly jump to a paren once it's balanced
set wrap                    " Wrap text
set linebreak               " don't wrap textin the middle of a word
set autoindent              " always set autoindenting on
set smartindent             " use smart indent if there is no indent file
set tabstop=4               " <tab> inserts 4 spaces
set shiftwidth=4            " an indent level is 4 spaces wide.
set softtabstop=4           " <BS> over an autoindent deletes both spaces.
set expandtab               " Use spaces, not tabs, for autoindent/tab key.
set shiftround              " rounds indent to a multiple of shiftwidth
set formatoptions=tcroql    " Setting text and comment formatting to auto
set textwidth=120            " Lines are automatically wrapped after 120 columns
set linespace=3             " The spacing between lines is a little roomier

""" Searching and Patterns
"set ignorecase              " Default to using case insensitive searches,
set smartcase               " unless uppercase letters are used in the regex.
set hlsearch                " Highlight searches by default.
set incsearch               " Incrementally search while typing a /regex

" Make diffs *really* obvious
hi DiffText gui=underline guibg=red guifg=black

" syntax highlighting for .hql files
au BufNewFile,BufRead *.hql set filetype=sql

""" NERDTree shortcuts
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
map <C-n> :NERDTreeToggle<CR>

""" For mouse click in NERDTree
:set mouse=a
let g:NERDTreeMouseMode=3 

" Additional
nnoremap <F5> :GundoToggle<CR>
