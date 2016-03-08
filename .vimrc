" Basics {
    set nocompatible        " Must be first line
    set shell=/bin/sh
" }

" General {
    set background=dark         " Assume a dark background
    " if !has('gui')
        "set term=$TERM          " Make arrow and other keys work
    " endif
    filetype plugin indent on   " Automatically detect file types.
    set tabstop=4
    set shiftwidth=4
    set expandtab ts=4 sw=4 ai
    syntax on                   " Syntax highlighting
    set mouse=a                " Automatically enable mouse usage
    set mousehide               " Hide the mouse cursor while typing
    scriptencoding utf-8
    let mapleader = ","
    let maplocalleader = '_'

    set clipboard=unnamed  " use the clipboards of vim and win
    set paste               " Paste from a windows or from vim
    set go=a               " Visual selection automatically copied to the clipboard"
    "if has('clipboard')
    "    if has('unnamedplus')  " When possible use + register for copy-paste
    "        set clipboard=unnamed,unnamedplus
    "    else         " On mac and Windows, use * register for copy-paste
    "        set clipboard=unnamed
    "    endif
    "endif

    " Most prefer to automatically switch to the current file directory when
    " a new buffer is opened; to prevent this behavior, add the following to
    " your .vimrc.before.local file:
    "   let g:spf13_no_autochdir = 1
    if !exists('g:spf13_no_autochdir')
        autocmd BufEnter * if bufname("") !~ "^\[A-Za-z0-9\]*://" | lcd %:p:h | endif
        " Always switch to the current file directory
    endif

    "set autowrite                       " Automatically write a file when leaving a modified buffer
    set shortmess+=filmnrxoOtT          " Abbrev. of messages (avoids 'hit enter')
    set viewoptions=folds,options,cursor,unix,slash " Better Unix / Windows compatibility
    set virtualedit=onemore             " Allow for cursor beyond last character
    set history=1000                    " Store a ton of history (default is 20)
    set spell                           " Spell checking on
    set hidden                          " Allow buffer switching without saving
    set iskeyword-=.                    " '.' is an end of word designator
    set iskeyword-=#                    " '#' is an end of word designator
    set iskeyword-=-                    " '-' is an end of word designator

    " Instead of reverting the cursor to the last position in the buffer, we
    " set it to the first line when editing a git commit message
    au FileType gitcommit au! BufEnter COMMIT_EDITMSG call setpos('.', [0, 1, 1, 0])

    " http://vim.wikia.com/wiki/Restore_cursor_to_file_position_in_previous_editing_session
    " Restore cursor to file position in previous editing session
    " To disable this, add the following to your .vimrc.before.local file:
    "   let g:spf13_no_restore_cursor = 1
    if !exists('g:spf13_no_restore_cursor')
        function! ResCur()
            if line("'\"") <= line("$")
                normal! g`"
                return 1
            endif
        endfunction

        augroup resCur
            autocmd!
            autocmd BufWinEnter * call ResCur()
        augroup END
    endif

    " Setting up the directories {
        set nobackup                   " Backups are no longer used ...
        set undofile
        set undodir=~/.undodir         " Put the backup into .undodir

        "set nobackup                  " Backups are nice ...
        "set noundofile
 "       if has('persistent_undo')
 "           set undofile                " So is persistent undo ...
 "           set undolevels=1000         " Maximum number of changes that can be undone
 "           set undoreload=10000        " Maximum number lines to save for undo on a buffer reload
 "       endif

        " To disable views add the following to your .vimrc.before.local file:
        "   let g:spf13_no_views = 1
        if !exists('g:spf13_no_views')
            " Add exclusions to mkview and loadview
            " eg: *.*, svn-commit.tmp
            let g:skipview_files = [
                \ '\[example pattern\]'
                \ ]
        endif
    " }

" }

" Use bundles config {
    if filereadable(expand("~/.vimrc.bundles"))
        source ~/.vimrc.bundles
    endif
" }


" Vim UI {
    if !exists('g:override_spf13_bundles') && filereadable(expand("~/.vim/bundle/vim-colors-solarized/colors/solarized.vim"))
        let g:solarized_termcolors=256
        let g:solarized_termtrans=1
        let g:solarized_contrast="high"
        let g:solarized_contrast="high"
        "let g:solarized_visibility="normal"
        "let g:solarized_visibility="normal"
        color solarized             " Load a colorscheme
    endif

    set tabpagemax=15               " Only show 15 tabs
    set showmode                    " Display the current mode

    set cursorline                  " Highlight current line

    highlight clear SignColumn      " SignColumn should match background
    highlight clear LineNr          " Current line number row will have same background color in relative mode
    "highlight clear CursorLineNr    " Remove highlight color from current line number

    if has('cmdline_info')
        set ruler                   " Show the ruler
        set rulerformat=%30(%=\:b%n%y%m%r%w\ %l,%c%V\ %P%) " A ruler on steroids
        set showcmd                 " Show partial commands in status line and
                                    " Selected characters/lines in visual mode
    endif

    if has('statusline')
        set laststatus=2

        " Broken down into easily includeable segments
        set statusline=%<%f\                     " Filename
        set statusline+=%w%h%m%r                 " Options
        if !exists('g:override_spf13_bundles')
            set statusline+=%{fugitive#statusline()} " Git Hotness
        endif
        set statusline+=\ [%{&ff}/%Y]            " Filetype
        set statusline+=\ [%{getcwd()}]          " Current dir
        set statusline+=%=%-14.(%l,%c%V%)\ %p%%  " Right aligned file nav info
    endif

    set backspace=indent,eol,start  " Backspace for dummies
    set linespace=0                 " No extra spaces between rows
    set nu                          " Line numbers on
    " added by shengym disable the mathching

    set showmatch                   " Show matching brackets/parenthesis
    set incsearch                   " Find as you type search
    set hlsearch                    " Highlight search terms
    set winminheight=0              " Windows can be 0 line high
    set ignorecase                  " Case insensitive search
    set smartcase                   " Case sensitive when uc present
    set wildmenu                    " Show list instead of just completing
    set wildmode=list:longest,full  " Command <Tab> completion, list matches, then longest common part, then all.
    set whichwrap=b,s,h,l,<,>,[,]   " Backspace and cursor keys wrap too
    set scrolljump=5                " Lines to scroll when cursor leaves screen
    set scrolloff=3                 " Minimum lines to keep above and below cursor
    set foldenable                  " Auto fold code
    set list
    " added by shengym
    "set listchars=extends:#,nbsp:. " Highlight problematic whitespace
    set listchars=tab:›\ ,trail:•,extends:#,nbsp:. " Highlight problematic whitespace

    "only show file name by removing dir path
    function ShortTabLabel ()
	let bufnrlist = tabpagebuflist (v:lnum)
	let label = bufname (bufnrlist[tabpagewinnr (v:lnum) -1])
	let filename = fnamemodify (label, ':t')
	return filename
    endfunction
   " set guitablabel=%{ShortTabLabel()}
   
   "This will show the tab index rather than the --2  dir name
if exists("+showtabline")
    function! MyTabLine()
        let s = ''
        let wn = ''
        let t = tabpagenr()
        let i = 1
        while i <= tabpagenr('$')
            let buflist = tabpagebuflist(i)
            let winnr = tabpagewinnr(i)
            let s .= '%' . i . 'T'
            let s .= (i == t ? '%1*' : '%2*')
            let s .= ' '
            let wn = tabpagewinnr(i,'$')

            let s .= '%#TabNum#'
            let s .= i
            let s .= (i == t ? '%#TabLineSel#' : '%#TabLine#')
            let bufnr = buflist[winnr - 1]
            let file = bufname(bufnr)
            let buftype = getbufvar(bufnr, 'buftype')
            if buftype == 'nofile'
                if file =~ '\/.'
                    let file = substitute(file, '.*\/\ze.', '', '')
                endif
            else
                let file = fnamemodify(file, ':p:t')
            endif
            if file == ''
                let file = '[No Name]'
            endif
            let s .= ' ' . file . ' '
            let i = i + 1
        endwhile
        let s .= '%T%#TabLineFill#%='
        let s .= (tabpagenr('$') > 1 ? '%999XX' : 'X')
        return s
    endfunction
    set stal=2
    set tabline=%!MyTabLine()
    set showtabline=1
    highlight link TabNum Special
endif
" }
" Mappings {
    " tab switch {
	"map <C-Left> :tabprevious<CR>
	"map <C-Right> :tabnext<CR>
    " }
     " buffer switch {
	" This allows buffers to be hidden if you've modified a buffer.
	" This is almost a must if you wish to use buffers in this way.
	set hidden
	" To open a new empty buffer
	nmap <leader>bN :enew<cr>
	nmap <leader>N :enew<cr>

	" Move to the next buffer
	nmap <leader>bn :bnext<CR>
	nmap <leader>n :bnext<CR>

	" Move to the previous buffer
	nmap <leader>bp :bprevious<CR>
	nmap <leader>p :bprevious<CR>
	" Move to the previous buffer
        nnoremap <leader>q :bp<cr>:bd #<cr>
	" Close the current buffer and move to the previous one
	" This replicates the idea of closing a tab
	nmap <leader>bq :bp <BAR> bd #<CR>

     " }
" }
" Plugins {
    " NerdTree {
        if isdirectory(expand("~/.vim/bundle/nerdtree"))
	    "open nerdtree automaticaaly
	    autocmd VimEnter * NERDTree

	    map <C-o> <plug>NERDTreeTabsToggle<CR>
            map <leader>e :NERDTreeFind<CR>
            nmap <leader>nt :NERDTreeFind<CR>
            "map <Leader>n <plug>NERDTreeTabsToggle<CR>
            map <C-h> <plug>NERDTreeSteppedOpen<CR>
            map <C-l> <plug>NERDTreeSteppedClose<CR>
            let NERDTreeShowBookmarks=1
            let NERDTreeIgnore=['\.py[cd]$', '\~$', '\.swo$', '\.swp$', '^\.git$', '^\.hg$', '^\.svn$', '\.bzr$']
            let NERDTreeChDirMode=0
            let NERDTreeQuitOnOpen=0
            let NERDTreeMouseMode=2
            let NERDTreeShowHidden=1
            let NERDTreeKeepTreeInNewTab=1
            let g:nerdtree_tabs_open_on_gui_startup=0
            let g:nerdtree_tabs_open_on_console_startup=1
        endif
    " }
    " Ctags {
        set tags=./tags;/,~/.vimtags
        nnoremap t <C-]>
        nnoremap q <C-T> :bd #<CR>

        " Make tags placed in .git/tags file available in all levels of a repository
        let gitroot = substitute(system('git rev-parse --show-toplevel'), '[\n\r]', '', 'g')
        if gitroot != ''
            let &tags = &tags . ',' . gitroot . '/.git/tags'
        endif
    " }
    " Tagbar {
        if isdirectory(expand("~/.vim/bundle/tagbar"))
            let g:tagbar_usearrows = 1
            nnoremap <leader>tl :TagbarToggle<CR>
        endif
    " }
    " Session List {
        set sessionoptions=blank,buffers,curdir,folds,tabpages,winsize
        if isdirectory(expand("~/.vim/bundle/sessionman.vim/"))
            nmap <leader>sl :SessionList<CR>
            nmap <leader>ss :SessionSave<CR>
            nmap <leader>sc :SessionClose<CR>
        endif
    " }
    " vim-airline {
        " Set configuration options for the statusline plugin vim-airline.
        " Use the powerline theme and optionally enable powerline symbols.
        " To use the symbols , , , , , , and .in the statusline
        " segments add the following to your .vimrc.before.local file:
        "   let g:airline_powerline_fonts=1
        " If the previous symbols do not render for you then install a
        " powerline enabled font.

        " See `:echo g:airline_theme_map` for some more choices
        " Default in terminal vim is 'dark'
        if isdirectory(expand("~/.vim/bundle/vim-airline/"))
	    " Enable the list of buffers
	    let g:airline#extensions#tabline#enabled = 1

	    " Show just the filename
	    let g:airline#extensions#tabline#fnamemod = ':t'
	    "let g:airline_theme = 'solarized'
	    let g:airline_theme = 'powerlineish'
	    let g:airline_left_sep='›'  " Slightly fancier than '>'
	    let g:airline_right_sep='‹' " Slightly fancier than '<'
        endif
    " }
    " Ctrlp {
        if isdirectory(expand("~/.vim/bundle/ctrlp.vim"))
		" Setup some default ignores
		let g:ctrlp_custom_ignore = {
		\ 'dir':  '\v[\/](\.(git|hg|svn)|\_site)$',
		\ 'file': '\v\.(exe|so|dll|class|png|jpg|jpeg)$',
		\}

		" Use the nearest .git directory as the cwd	
		" This makes a lot of sense if you are working on a project that is in version
		" control. It also supports works with .svn, .hg, .bzr.
		let g:ctrlp_working_path_mode = 'r'

		" Use a leader instead of the actual named binding
		nmap <leader>f :CtrlP<cr>

		" Easy bindings for its various modes
		nmap <leader>fb :CtrlPBuffer<cr>
		nmap <leader>fm :CtrlPMRU<cr>
		nmap <leader>fa :CtrlPMixed<cr>
        endif
    " }
    " Buffergator {
        if isdirectory(expand("~/.vim/bundle/vim-buffergator"))
		" Use the right side of the screen
		let g:buffergator_viewport_split_policy = 'R'

		" I want my own keymappings...
		let g:buffergator_suppress_keymaps = 1

		" Looper buffers
		"let g:buffergator_mru_cycle_loop = 1

		" Go to the previous buffer open
		nmap <leader>jj :BuffergatorMruCyclePrev<cr>

		" Go to the next buffer open
		nmap <leader>kk :BuffergatorMruCycleNext<cr>

		" View the entire list of buffers open
		nmap <leader>bl :BuffergatorOpen<cr>

        endif
    " }
    " gotags {
	let g:tagbar_type_go = {
	    \ 'ctagstype' : 'go',
	    \ 'kinds'     : [
		\ 'p:package',
		\ 'i:imports:1',
		\ 'c:constants',
		\ 'v:variables',
		\ 't:types',
		\ 'n:interfaces',
		\ 'w:fields',
		\ 'e:embedded',
		\ 'm:methods',
		\ 'r:constructor',
		\ 'f:functions'
	    \ ],
	    \ 'sro' : '.',
	    \ 'kind2scope' : {
		\ 't' : 'ctype',
		\ 'n' : 'ntype'
	    \ },
	    \ 'scope2kind' : {
		\ 'ctype' : 't',
		\ 'ntype' : 'n'
	    \ },
	    \ 'ctagsbin'  : 'gotags',
	    \ 'ctagsargs' : '-sort -silent'
	\ }
    " }
" }
