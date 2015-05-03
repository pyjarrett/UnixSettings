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
"colorscheme desert (Kept so I always remember my former color scheme)
"colorscheme solarized
colorscheme wombat
syntax on

" Scythe Language
au BufRead,BufNewFile *.scy set filetype=scythe

" Folding
set autoindent
set foldmethod=indent
set foldlevel=1
set gfn=Monaco:h12


" Saves a bunch of things when saving sessions
set sessionoptions=blank,buffers,curdir,folds,help,options,resize,tabpages,winpos,winsize

" Enables looking up functions while still in vim
" Lookup functions by using SHIFT-K
runtime! ftplugin/man.vim

" Sets NETRW to use tree style
let g:netrw_liststyle=3

if(hostname()=="theodicy")
    set gfn=UbuntuMono\ 10
endif

" Removes menu and tab bars when graphical
if has("gui_running")
    set guioptions-=m
    set guioptions-=T
endif
" Tagbar toggle.
nmap <F8> :TagbarToggle<CR> 

set t_Co=256
