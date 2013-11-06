" Tabbing
set tabstop=4
set shiftwidth=4
set ts=4    
set expandtab

" Get rid of annoying bells
set noerrorbells visualbell t_vb=

" Search
set incsearch
set hlsearch

" Pretty formatting for gq
set textwidth=80

" Enable syntax 
syntax on

" Folding
set autoindent
set foldmethod=indent
set foldlevel=1

" Saves a bunch of things when saving sessions
set sessionoptions=blank,buffers,curdir,folds,help,options,resize,tabpages,winpos,winsize

" Enables looking up functions while still in vim
" Lookup functions by using SHIFT-K
runtime! ftplugin/man.vim

" Sets NETRW to use tree style
let g:netrw_liststyle=3

" Setting the font
set gfn=Courier\ 10\ Pitch\ 9
if(hostname()=="theodicy")
  colorscheme solarized
  set gfn=UbuntuMono\ 10
endif

" Removes menu and tab bars when graphical
if has("gui_running")
  set guioptions-=m
  set guioptions-=T
endif

