" Pathogen load
filetype off
call pathogen#infect()
call pathogen#helptags()

" Syntax highlighting
filetype plugin on
syntax on

" Tabbing
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab

" Get rid of annoying bells
set noerrorbells visualbell t_vb=

" Search
set incsearch
set hlsearch

" Pretty formatting for gq
set textwidth=100

" Scythe Language
au BufRead,BufNewFile *.scy set filetype=scythe

" automatically change window's cwd to file's dir
set autochdir

" Folding
set autoindent
set foldmethod=indent
set foldlevel=1
"set gfn=Monaco:h11
set gfn=Monaco:h13

" Show line numbers
set number

" Prevents Read-Only Diff
set noro

" Saves a bunch of things when saving sessions
set sessionoptions=blank,buffers,curdir,folds,help,options,resize,tabpages,winpos,winsize

" Enables looking up functions while still in vim
" Lookup functions by using SHIFT-K
runtime! ftplugin/man.vim

" Sets NETRW to use tree style
let g:netrw_liststyle=3



if(hostname()=="theodicy")
    set gfn=UbuntuMono\ 9
endif

" Removes menu and tab bars when graphical
if has("gui_running")
    set guioptions-=m
    set guioptions-=T

    " Display 
    let terminals = str2nr(system("ps aux | grep Vim | wc -l"))
    "let color_scheme_index = system("python -c 'import random; print random.randint(5,10)'")
    colorscheme summerfruit
    if terminals=="5"
        colorscheme summerfruit
    elseif terminals=="6"
        colorscheme wombat
    elseif terminals=="7"
        colorscheme desert
    elseif terminals=="8"
        colorscheme solarized
    elseif terminals=="9"
        colorscheme material
    endif

" Other colorschemes
" rearden (if I can find this one again)
" khaki
" parsec
" codeschool
" darkspectrum
" flatlandia
" itg_flat
" kolor
" 
"colorscheme desert (Kept so I always remember my former color scheme)
"colorscheme solarized
else
    colorscheme desert
endif
" Tagbar toggle.
nmap <F8> :TagbarToggle<CR> 

" Other fonts
" Consolas, Menlo, 
map <C-k> :set gfn=Monaco:h11<CR>:set columns=200<CR>:set lines=200<CR>
map <C-o> :set gfn=Monaco:h13<CR>:set columns=200<CR>:set lines=200<CR>
map <C-@> :set columns=200<CR>:set lines=200<CR>


set t_Co=256
""let g:tagbar_ctags_bin='/opt/local/bin/ctags'
"set tags=tags;
set modeline

" Open TagbarToggle on startup, but need to do it this way because plugins aren't loaded when .vimrc
" gets read.
autocmd VimEnter *.{py,tex,cpp,c,h,hpp,rb} TagbarToggle


" python-mode settings
let g:pymode_rope=0
let g:pymode_lint_ignore="E501,W601"

" vim-jedi settings
let g:jedi#show_call_signatures = "0"
let g:jedi#popup_on_dot = 1

" show a visual line under the cursor's current line
set cursorline

" show the matching part of the pair for [] {} and ()
set showmatch

" enable all Python syntax highlighting features
let python_highlight_all = 1


" Syntastic plugin-settings
"set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" Disable PEP8 checks
let g:syntastic_python_checkers=['flake8']
let g:syntastic_python_flake8_args='--ignore=E501,E225,W601'
