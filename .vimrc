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

" Display 
colorscheme desert
syntax on

" Folding
set autoindent
set foldmethod=indent
set foldlevel=1
set gfn=Menlo\ Regular:h11

" Enables looking up functions while still in vim
runtime! ftplugin/man.vim

" Removes menu and tab bars when graphical
if has("gui_running")
  set guioptions-=m
  set guioptions-=T
endif

