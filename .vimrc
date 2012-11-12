set tabstop=4
set shiftwidth=4
set ts=4    
colorscheme desert
set guioptions-=T " disables toolbar
set incsearch


set noerrorbells visualbell t_vb=



" Enable LEXT syntax highlighting
"let mysyntaxfile = "/Users/pauljarrett/Studio/lext/lext/lext.vim"
syntax on
au BufRead,BufNewFile *.lext set filetype=lext
au! Syntax lext source /Users/pauljarrett/Studio/lext/lext/lext.vim


"let mysyntaxfile = "/Users/pauljarrett/Studio/scythe/scythe.vim"
au BufRead,BufNewFile *.scy set filetype=scy
au! Syntax scy source /Users/pauljarrett/Studio/scythe/scythe.vim


"let mysyntaxfile = "/Users/pauljarrett/Studio/scythe/polyglot.vim"
au BufRead,BufNewFile *.poly set filetype=poly
au! Syntax poly source /Users/pauljarrett/Studio/scythe/poly.vim

colorscheme desert
set tabstop=4
set shiftwidth=4
set expandtab
syntax on
set autoindent
set foldmethod=indent
set foldlevel=1
set incsearch
set hlsearch

set textwidth=80

set gfn=Menlo\ Regular:h11

runtime! ftplugin/man.vim

if has("gui_running")
  set guioptions-=m
  set guioptions-=T
endif

syntax on
au BufRead,BufNewFile *.scy set filetype=scy
au! Syntax scy source /Users/jarrett/Projects/scythe/scythe.vim

au BufRead,BufNewFile *.fsh set filetype=glsl
au BufRead,BufNewFile *.vsh set filetype=glsl

au BufRead,BufNewFile *.design set filetype=design
au! Syntax design source /Users/jarrett/Projects/scythe/design.vim

