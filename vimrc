call pathogen#infect()
set nocompatible " This ain't no vi

set background=dark " Choose colours that work well with a dark background
set t_Co=256
"let g:molokai_original = 1
colorscheme molokai

filetype plugin on " Load plugins for filetypes
syntax on          " Enable syntax highlighting

set bs=2      " Allow backspace to delete
set nowrap    " Disable line wrapping
set title     " Set the title of the terminal to the filename of the file
set number    " Show line numbers
set showmatch " Show matching parentheses

" Setup tabbing
set autoindent
set smartindent
set smarttab

set tabstop=2     " Set tab width to 2 columns
set expandtab     " Enable expansion of tabs into spaces
set shiftwidth=2  " Set indentation commands to move 2 columns at a time
set softtabstop=2 " Set how many columns to use when tabbing in insert mode

" Makefile sanity
autocmd BufEnter ?akefile* set noet ts=4 sw=4
autocmd BufEnter */debian/rules set noet ts=4 sw=4

" Tab/space indentation detection by Kees Cook, with small modifications
" http://www.outflux.net/blog/archives/2007/03/09/detecting-space-vs-tab-indentation-type-in-vim/
function Kees_settabs()
    if len(filter(getbufline(winbufnr(0), 1, "$"), 'v:val =~ "^\\t"')) > len(filter(getbufline(winbufnr(0), 1, "$"), 'v:val =~ "^ "'))
        set noet ts=2 sw=2
    endif
endfunction
autocmd BufReadPost * call Kees_settabs()

" Set up searching
set hlsearch   " Highlight all matching search terms
set ignorecase " Ignore case by default
set incsearch  " Search as you type
set smartcase  " Enable case-sensitivity when capitals are used

" Bind paste mode toggle to F2 (fixes pasting issues when enabled)
set pastetoggle=<F2>

" Enable the mouse
set mouse=a
set mousehide

set exrc   " Enable per-directory .vimrc files
set secure " Disable unsafe commands in local .vimrc files

" Hitting Enter when in Command mode creates a new line
map <CR> o<ESC>
map <Del> "_x
