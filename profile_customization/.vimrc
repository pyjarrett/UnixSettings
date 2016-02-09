""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                   Vundle
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set nocompatible              " be iMproved, required
filetype off                  " required
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
" Keep Plugin commands between vundle#begin/end.
" alternatively, pass a path where Vundle should install plugins
Plugin 'VundleVim/Vundle.vim' " let Vundle manage Vundle, required
Plugin 'tpope/vim-fugitive'
Plugin 'scrooloose/syntastic'
Plugin 'Valloric/YouCompleteMe'
" Plugin 'davidhalter/jedi-vim' " alternative to YCM for python
Plugin 'vim-airline/vim-airline'
Plugin 'scrooloose/nerdtree'
Plugin 'flazz/vim-colorschemes'
Plugin 'majutsushi/tagbar'
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets' " ultisnip snippets
Plugin 'ervandew/supertab'
Plugin 'rust-lang/rust.vim'
" TODO: Try out Rope.
" Other plugin examples.
" plugin from http://vim-scripts.org/vim/scripts.html
" Plugin 'L9'
" Git plugin not hosted on GitHub
" Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
" Plugin 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
" Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Avoid a name conflict with L9
" Plugin 'user/L9', {'name': 'newL9'}
call vundle#end()            " required
filetype plugin indent on    " required


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                           VIM SPECIFIC SETTINGS
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
syntax on

" Tabbing
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab

" Get rid of annoying bells
set noerrorbells visualbell t_vb=

" Allow incremental and highlighted search to show ALL matches.
set incsearch
set hlsearch

" Enable use of mouse in vim
set mouse=a

" Pretty formatting for gq to cut text off at column 100.
set textwidth=100

" automatically change window's cwd to file's dir
set autochdir

" Folding
set autoindent
set foldmethod=indent
set foldlevel=1

" Show line numbers
set number

" Prevents Read-Only Diff
set noro

" Saves a bunch of things when saving sessions
set sessionoptions=blank,buffers,curdir,folds,help,options,resize,tabpages,winpos,winsize

" Recursively search for tags files
set tags=./tags;

" Enables leading modelines in source code.
set modeline

" Show a visual line for the cursor's current line
set cursorline

" show the matching part of the pair for [] {} and ()
set showmatch

" Open splits on right instead of left. Helpful with netrw or NERDTree
set splitright

" Sets NETRW to use tree style
let g:netrw_liststyle=3

" enable all Python syntax highlighting features
let python_highlight_all = 1

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                       Environment Specific Settings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Courtesy warning to inform me python-enabled plugins won't work.
if !has('python')
    echo "No python support."
endif


" Allows randomly choosing colorscheme randomly based on environment.
function! PickRandomCS()
    if has("gui_running")
        let s:favorite_schemes = [
                    \ "abra",
                    \ "anotherdark",
                    \ "atom",
                    \ "candycode",
                    \ "clearance",
                    \ "desert",
                    \ "distinguished",
                    \ "h80",
                    \ "impactjs",
                    \ "jammy",
                    \ "jellybeans",
                    \ "neverland2-darker",
                    \ "nightsky",
                    \ "northsky",
                    \ "selenitic",
                    \ "solarized",
                    \ "seoul256",
                    \ "summerfruit",
                    \ "symfony",
                    \ "taqua",
                    \ "wombat" ]
    else
        let s:favorite_schemes = [
                    \ "charged-256",
                    \ "desert256",
                    \ "grb256",
                    \ "seoul256"]
    endif
    let random_scheme_idx = str2nr(system("echo $RANDOM")) % len(s:favorite_schemes)
    execute 'colorscheme ' . s:favorite_schemes[random_scheme_idx]
endfunction
map <C-k> :call PickRandomCS()<CR>
call PickRandomCS()


if has("gui_running")
    " Removes menu and tab bars when graphical
    set guioptions-=m
    set guioptions-=T
else
    " Tells vim to use 256 colors. Overrides some termcap (?) issues.
    set t_Co=256

    " Use background color for clearing. Fixes an issue with tmux not properly displaying bg colors.
    set t_ut=
endif


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                   Font and View Control
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Makes vim fill as much space as possible
function! FillScreen()
    " 400 here is an arbitrary number.
    set columns=400
    set lines=400
endfunction
map <C-@>call FillScreen()<CR>


function! SetCustomFont()
    execute 'set gfn=' . g:custom_font_name . ':h' . string(get(g:custom_font_sizes, g:custom_font_toggle))
endfunction


" Lets me swap between a large and small font while filling screen at the same time.
function! SwapCustomFontSize()
    let g:custom_font_toggle = (g:custom_font_toggle + 1) % len(g:custom_font_sizes)
    call SetCustomFont()
    call FillScreen()
endfunction


" Builds a big and small font size to toggle between.
if has("unix")
    let s:uname = system("uname -s")
    if s:uname =~ "Darwin"
        " Other Good schemes to choose from: Menlo, Monaco, PT Mono, Consolas
        let g:custom_font_name = "Monaco"
        let g:custom_font_sizes = [11, 13]
        let g:custom_font_toggle = 1
        call SetCustomFont()
        call FillScreen()
        map <C-o> :call SwapCustomFontSize()<CR>
    " else
    " TODO: Add other unix available fonts
    endif
endif


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                           PLUGIN SETTINGS
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""""""""""""
" tagbar.vim: Tagbar toggle.
let g:tagbar_show_linenumbers = 0
nmap <F8> :TagbarToggle<CR>

" TagbarToggle on startup, but need to do it this way because plugins aren't loaded when .vimrc gets read.
autocmd VimEnter *.{py,tex,cpp,c,h,hpp,rb} TagbarToggle


""""""""""""""""""""
" NERDTREE
let NERDTreeShowBookmarks = 1


""""""""""""""""""""
" Syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0
let g:syntastic_loc_list_height=5

" Requires: `pip install flake8
let g:syntastic_python_checkers=['flake8']
" Disable some PEP8 checks
" E501: Line too long
" E128: Hanging indent
let g:syntastic_python_flake8_args='--ignore=E501,E128' 
let g:syntastic_ignore_files=['.tex']


""""""""""""""""""""
" Rust.vim
let g:rustfmt_autosave = 1
let g:rust_conceal = 1
let g:rust_conceal_mod_path = 1

""""""""""""""""""""
" you-complete-me
let g:ycm_global_ycm_extra_conf = '~/.ycm_extra_conf.py'


""""""""""""""""""""
" Ultisnips
" make YCM compatible with UltiSnips (using supertab)
let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']
let g:SuperTabDefaultCompletionType = '<C-n>'
let g:SuperTabCrMapping = 0
