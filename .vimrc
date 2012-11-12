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

