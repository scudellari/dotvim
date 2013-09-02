" ---------------------- Basic configuration settings ------------------------
set autoindent              " Maintain indent levels automatically.
set backspace=2             " Allow backspacing in basically every possible
                            " situation (the way I like it).
set foldcolumn=4            " Show a 4-column gutter to the left for
                            " folding characters.
set foldmethod=marker       " Fold on markers; {{{ and }}} by default.
set formatoptions=tqnw      " Auto-wrap by tw, allow 'gq', recognize lists,
                            " and trailing whitespace continues a paragraph.
set ignorecase smartcase    " Case insensitive search unless caps are used
                            " in search term.
set laststatus=2            " Always show the status line.
set textwidth=0             " By default, don't wrap at any specific
                            " column.
set linebreak wrap          " Wrap text while typing (this is a soft wrap
                            " without textwidth set).
set mouse=a                 " Allow use of the mouse in all situations.
set nu                      " Use line numbering.
set shiftwidth=4            " That means I like to indent by that amount as
                            " well.
set showcmd                 " Show commands as I am typing them.
set ts=4                    " The best tab stop is 4.
set whichwrap=h,l,~,[,]     " These keys will move the cursor over line
                            " boundaries ('wrap').
set wildmenu                " Tab completion for files with horizontal list
                            " of choices.
set winminheight=0          " Allow window split borders to touch.
set scrolloff=5             " Don't let the cursor get fewer than 5 lines
                            " away from the edge whenever possible.
set modeline                " Always read modeline stuff from the bottom of
                            " files.
set modelines=1             " Read the modeline only from the last line.
let mapleader=","           " Use comma instead of backslash as my map
                            " leader.
set incsearch               " Search incrementally (while typing).
set hidden                  " Don't unload buffers that are abandoned; hide
                            " them.
set fileformats=unix,dos    " Create UNIX format files by default, but
                            " autodetect dos files.

" Don't create backup files when editing in these locations.
set backupskip=/tmp/*,/private/tmp/*

" Display unprintable characters in a particular way.
" Leave *list* turned off by default, though.
set nolist listchars=tab:›\ ,trail:-,extends:>,precedes:<,eol:¬

" Allow the html syntax file to recognize improper comments.
" Because I use them. Improperly.
let g:html_wrong_comments = 1

" A couple of environment variables for the spelling stuff.
let IspellLang = 'english'

" ------------------------- Version-specific options -------------------------
if v:version > 702
    set undofile
    set undolevels=1000
    set undoreload=10000
    au BufWritePre /tmp/* setlocal noundofile
    au BufWritePre /private/tmp/* setlocal noundofile
endif

" ############################################################################
" #          Configure any plugin-specific settings and mappings.            #
" ############################################################################

" ------------------------------- AutoClose ----------------------------------
let g:AutoClosePairs = "' \" [] () {}"

" ----------------------------- Indent Guides --------------------------------
let g:indent_guides_color_change_percent = 3

" --------------------------------- TagBar -----------------------------------
let g:tagbar_autoclose = 1
if has("gui_win32")
    let g:tagbar_ctags_bin = 'd:\bin\ctags\ctags.exe'

    " This one is not really TagBar-specific, but it involves tags. Use my global PHP tags in Windows.
    set tags=c:\Users\abieber\tags-php
else
    let g:tagbar_ctags_bin = 'ctags'
    set tags=~/ctags_php
endif
nmap <F8> :TagbarToggle<CR>

" -------------------------------- NERDTree ----------------------------------
map <c-t> :NERDTreeToggle<CR>
let NERDTreeDirArrows=1
let NERDTreeQuitOnOpen=0

" --------------------------------- CtrlP ------------------------------------
let g:ctrlp_open_new_file = 'h'

" ------------------------------- Quicktask ----------------------------------
let g:quicktask_autosave = 1
if has("gui_win32")
    let g:quicktask_snip_path = 'c:\Users\a.bieber\Dropbox\snips'
else
    let g:quicktask_snip_path = '~/Dropbox/snips'
endif
let g:quicktask_snip_win_maximize = 1
let g:quicktask_snip_default_filetype = "markdown"

" -------------------------------- Snippets ----------------------------------
"let snippets_dir = substitute(substitute(globpath(&rtp, 'snippets/'), "\n", ',', 'g'), 'snippets\\,', 'snippets,', 'g')
let g:snips_author = 'Aaron Bieber <abieber@wayfair.com>'

" -------------------------------- Syntastic ---------------------------------
let g:syntastic_php_checkers = ['php', 'phpcs', 'phpmd']
let g:syntastic_error_symbol='✗'
let g:syntastic_warning_symbol='⚠'

let g:syntastic_php_phpcs_errorformat =
    \ '%-GFile\,Line\,Column\,Type\,Message\,Source\,Severity,'.
    \ '"%f"\,%l\,%c\,%t%*[a-zA-Z]\,"%m"\,%*[a-zA-Z0-9_.-\*]\,%*[0-9]'

" ------------------------------- LaTeX Suite -------------------------------
let g:Tex_DefaultTargetFormat = 'pdf'

" vim: set et ts=4 sw=4 :
