" Tabbing
set tabstop=4
set shiftwidth=4
set ts=4    
set expandtab

set modelines=3

" Get rid of annoying bells
set noerrorbells visualbell t_vb=

" Set tree style for default listing
let g:netrw_liststyle= 4


" ClangComplete options
set completeopt=menu,menuone,longest
let g:clang_complete_auto = 0

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
set gfn=Menlo\ Regular:h10

" Enables looking up functions while still in vim
runtime! ftplugin/man.vim
au BufNewFile,BufRead *.frag,*.vert,*.fp,*.vp,*.glsl setf glsl 


" Exuberant ctags
" Only look up to home directory)
set tags=./tags;$HOME

" Removes menu and tab bars when graphical
if has("gui_running")
  set guioptions-=m
  set guioptions-=T
endif

