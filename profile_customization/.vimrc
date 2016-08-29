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
Plugin 'vim-airline/vim-airline'
Plugin 'scrooloose/nerdtree'
Plugin 'flazz/vim-colorschemes'
Plugin 'majutsushi/tagbar'
Plugin 'rust-lang/rust.vim'
Plugin 'airblade/vim-gitgutter'
Plugin 'Xuyuanp/nerdtree-git-plugin'
Plugin 'noah/vim256-color'
Plugin 'ctrlpvim/ctrlp.vim'           " the ultimate in file search
Plugin 'freitass/todo.txt-vim'        " todo.txt creation and updates
Plugin 'kshenoy/vim-signature'
" http://www.vim.org/scripts/script.php?script_id=2666
"Plugin 'davidhalter/jedi-vim' " alternative to YCM for python
"Plugin 'SirVer/ultisnips'
"Plugin 'honza/vim-snippets' " ultisnip snippets
"Plugin 'ervandew/supertab'
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
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab

" Get rid of annoying bells
set noerrorbells visualbell t_vb=

" Allow incremental and highlighted search to show ALL matches.
set incsearch
set hlsearch

" Enable use of mouse in vim
set mouse=a

" Pretty formatting for gq to cut text off at a set column.
set textwidth=80
set colorcolumn=+1

" automatically change window's cwd to file's dir
set autochdir

" Folding
set autoindent
set foldmethod=indent
set foldlevel=1
set foldcolumn=4

" Enables spell checking in comments.
set spell spelllang=en_us

" Show line numbers
set number

" Prevents Read-Only Diff
set noro

" Saves a bunch of things when saving sessions
set sessionoptions=blank,buffers,curdir,folds,help,options,resize,tabpages,winpos,winsize

" Recursively search for tags files
set tags=./tags;
set dictionary=/usr/share/dict/words

" Enables leading modelines in source code.
set modeline

" Show a visual line for the cursor's current line
set cursorline
set cursorcolumn

" Highlights the current word under the cursor
autocmd CursorMoved * exe printf('match IncSearch /\V\<%s\>/', escape(expand('<cword>'), '/\'))

" show the matching part of the pair for [] {} and ()
set showmatch

" Open splits on right instead of left. Helpful with netrw or NERDTree
set splitright

" Sets NETRW to use tree style
let g:netrw_liststyle=3

" enable all Python syntax highlighting features
let python_highlight_all = 1

" Force markdown instead of Modula-2 recognition for md files.
autocmd BufNewFile,BufRead *.md set filetype=markdown

let maplocalleader='\'

set conceallevel=2

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                       Environment Specific Settings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Courtesy warning to inform me python-enabled plugins won't work.
if !has('python')
    echo "No python support."
endif

" Builds list of colorschemes to choose from based on current time.
function! LoadRandomCS()
if has("gui_running")
    let currentHour = strftime("%H")
    if currentHour < 6 || currentHour >= 18
        let s:favorite_schemes = [
                \ "abra",
                \ "anotherdark",
                \ "atom",
                \ "clearance",
                \ "desert",
                \ "distinguished",
                \ "impactjs",
                \ "jellybeans",
                \ "neverland2-darker",
                \ "nightsky",
                \ "selenitic",
                \ "seoul256",
                \ "symfony",
                \ "wombat" ]
    else
        let s:favorite_schemes = [
                \ "summerfruit",
                \ "taqua" ]
    endif
else
    let s:favorite_schemes = [
                \ "seoul256"]
endif
endfunction
call LoadRandomCS()

" Allows randomly choosing colorscheme randomly based on environment.
function! PickRandomCS()
    let s:favorite_schemes_idx = (s:favorite_schemes_idx + 1) % len(s:favorite_schemes)
    execute 'colorscheme ' . s:favorite_schemes[s:favorite_schemes_idx]
endfunction
map <C-k> :call PickRandomCS()<CR>
let s:favorite_schemes_idx = str2nr(system("echo $RANDOM")) % len(s:favorite_schemes)
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


map <C-@> :vertical resize 40<CR>:set wfw<CR>
" map <C-@>call FillScreen()<CR>


function! SetCustomFont()
    execute 'set gfn=' . g:custom_font_name . ':h' . string(get(g:custom_font_sizes, g:custom_font_toggle))
endfunction


" Lets me swap between a large and small font while filling screen at the same time.
function! SwapCustomFontSize()
    let g:custom_font_toggle = (g:custom_font_toggle + 1) % len(g:custom_font_sizes)
    call SetCustomFont()
endfunction


" Builds a big and small font size to toggle between.
if has("unix")
    let s:uname = system("uname -s")
    if s:uname =~ "Darwin"
        " Other Good schemes to choose from: Menlo, Monaco, PT Mono, Consolas
        let g:custom_font_name = "Monaco"
        let g:custom_font_sizes = [10, 12]
        let g:custom_font_toggle = 1
        call SetCustomFont()
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
" E123: closing bracket does not match indentation of opening bracket's line
" E124: closing bracket does not match visual indentation
" E125: continuation line over-indented for hanging indent
" E128: Hanging indent
" E501: Line too long
let g:syntastic_python_flake8_args='--ignore=E501,E123,E125,E128' 
let g:syntastic_ignore_files=['.tex', '.hpp', '.cpp']


""""""""""""""""""""
" Rust.vim
let g:rustfmt_autosave = 1
let g:rust_conceal = 1
let g:rust_conceal_mod_path = 1

""""""""""""""""""""
" you-complete-me
let g:ycm_global_ycm_extra_conf = '~/.ycm_extra_conf.py'
let g:ycm_rust_src_path = '/Users/paul/Projects/Rust/rust/src/'
let g:ycm_complete_in_comments = 1
let g:ycm_collect_identifiers_from_tags_files = 1

""""""""""""""""""""
" Ultisnips
" make YCM compatible with UltiSnips (using supertab)
" let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
" let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']
" let g:SuperTabDefaultCompletionType = '<C-n>'
" let g:SuperTabCrMapping = 0

""""""""""""""""""""
" nergtree-git-plugin
let g:NERDTreeIndicatorMapCustom = {
    \ "Modified"  : "✹",
    \ "Staged"    : "✚",
    \ "Untracked" : "✭",
    \ "Renamed"   : "➜",
    \ "Unmerged"  : "═",
    \ "Deleted"   : "✖",
    \ "Dirty"     : "✗",
    \ "Clean"     : "✔︎",
    \ "Unknown"   : "?"
    \ }

