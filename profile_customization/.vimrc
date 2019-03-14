
" REQUIRE MANUAL INTERVENTION TO ALLOW POTENTIALLY UNSAFE FEATURES
"if filereadable(expand('~/.vimrc.unsafe'))
"    source ~/.vimrc.unsafe
"else
    set nocompatible              " be iMproved, required
    filetype off                  " required
    filetype plugin indent on     " required
"endif

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                           VIM SPECIFIC SETTINGS
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
syntax on

" Tabbing
set tabstop=4
set shiftwidth=2
set softtabstop=2
set noexpandtab

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

" 'indent' is also acceptable here... can't remember why I had it chosen as
" indent over syntax.  rustfmt forces a bad corner here as it screws with
" indenting, but it's the community standard, so just roll with it.
" TODO: Possibly make this chosen based on file types.
set foldmethod=syntax 
set foldlevel=1
set foldcolumn=4  " shows 4 levels of folding in left gutter.

" Enables spell checking in comments.
set spell spelllang=en_us

" Show line numbers, since they make jumping around easier.
set number

" Prevents Read-Only Diff
set noro

" Saves a bunch of things when saving sessions
set sessionoptions=blank,buffers,curdir,folds,help,options,resize,tabpages,winpos,winsize

" Recursively search for tags files
set tags=./tags;

" Dictionary completion?  Awesome!  CTRL-X + CTRL-K  for dictionary completion.
set dictionary=/usr/share/dict/words

" Show a visual line for the cursor's current line
set cursorline
set cursorcolumn

" show the matching part of the pair for [] {} and ()
set showmatch

" Open splits on right instead of left. Helpful with netrw or NERDTree.
set splitright

" Sets NETRW to use tree style
let g:netrw_liststyle=3

" enable all Python syntax highlighting features
let python_highlight_all = 1

" Force markdown instead of Modula-2 recognition for md files.
autocmd BufNewFile,BufRead *.md set filetype=markdown
autocmd FileType markdown set nonumber foldcolumn=0
autocmd BufEnter todo.txt set nonumber foldcolumn=0

" Use '\' as the leader character for specialized commands (e.g. mark.vim)
let maplocalleader='\'

" Hides concealed text unless a replacement letter is defined.
set conceallevel=2

" Makes conceal take operator highlighting after colorscheme change.
autocmd ColorScheme * highlight! link Conceal Operator

" Auto-comment addition causes me more trouble than I like.  Insert-mode comment
" header addition seems ok, but it's incredibly irritating for 'O' or 'o' in
" normal mode.
" http://superuser.com/questions/271023/vim-can-i-disable-continuation-of-comments-to-the-next-line
autocmd BufNewFile,BufRead * setlocal formatoptions-=o formatoptions+=cr

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                       Environment Specific Settings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Courtesy warning to inform me python-enabled plugins won't work.
if !has('python3')
    echo "No python support."
endif

" Builds list of colorschemes to choose from based on current time.
function! LoadRandomCS()
    if has("gui_running")
        let currentHour = strftime("%H")
        if currentHour < 10 || currentHour >= 16
            let s:favorite_schemes = [
                    \ "abra",
                    \ "anotherdark",
                    \ "atom",
                    \ "clearance",
                    \ "desert",
                    \ "distinguished",
                    \ "impactjs",
                    \ "jellybeans",
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
let s:favorite_schemes_idx = str2nr(system("echo $RANDOM")) % len(s:favorite_schemes)
call PickRandomCS()

if has("gui_running")
    " Removes menu and tab bars when graphical
    set guioptions=
else
    " Tells vim to use 256 colors. Overrides some termcap (?) issues.
    set t_Co=256

    " Use background color for clearing. Fixes an issue with tmux not properly
    " displaying bg colors.
    set t_ut=
endif

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                   Font and View Control
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if has("gui_running")
    " Makes vim fill as much space as possible
    function! FillScreen()
        " 400 here is an arbitrary number.
        set columns=400
        set lines=400
    endfunction

    function! SetCustomFont()
        execute 'set gfn=' . g:custom_font_name . '\ ' . string(get(g:custom_font_sizes, g:custom_font_toggle))
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
        else
            let g:custom_font_name = "Ubuntu\\ Mono"
            let g:custom_font_sizes = [10, 12]
            let g:custom_font_toggle = 1
        endif
    endif

    call SetCustomFont()
    call FillScreen()
    nmap <C-o> :call SwapCustomFontSize()<CR>
endif

" Highlights the current word under the cursor
let g:highlight_current_keyword = 0
function! ToggleKeywordHighlight()
  if g:highlight_current_keyword == 0
    augroup highlight_keyword
      au!
      autocmd CursorMoved * exe printf('match IncSearch /\V\<%s\>/', escape(expand('<cword>'), '/\'))
    augroup END
    let g:highlight_current_keyword = 1
  else
    augroup highlight_keyword
      au!
    augroup END
    match none
    let g:highlight_current_keyword = 0
  endif
endfunction
call ToggleKeywordHighlight()

function! ToggleFoldColumnsAndNumbering()
  if &foldcolumn == 4
    set foldcolumn=0
    set nonumber
  else
    set foldcolumn=4
    set number
  endif
endfunction

""""""""""""""""""""
" NERDTREE
let NERDTreeShowBookmarks = 1

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Remapped function keys
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" for mark.vim simplify clearing marks
nmap <F2> :set foldlevel=2<CR>
nmap <F3> :call ToggleFoldColumnsAndNumbering()<CR>

" Makes disabling simple, because these tend to be a performance bottleneck on
" really, really, long files.
nmap <F9> :call ToggleKeywordHighlight()<CR>
nmap <F10> :set spell!<CR>

" Sometimes changing colorschemes is all you need to do to jolt your mind to
" rethink the problem.
nmap <C-k> :call PickRandomCS()<CR>

" Idea here was to lock NERDTree on the left side.
"nmap <C-@> :vertical resize 40<CR>:set wfw<CR>

" Maximizing MacVim on Mac is painful.
nmap <C-@> :call FillScreen()<CR>
