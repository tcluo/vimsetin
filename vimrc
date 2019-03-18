" Specify a directory for plugins (for Neovim: ~/.local/share/nvim/plugged)
call plug#begin('~/.vim/plugged')

" Make sure you use single quotes

" Shorthand notation; fetches https://github.com/junegunn/vim-easy-align
Plug 'junegunn/vim-easy-align'

" Any valid git URL is allowed
Plug 'https://github.com/junegunn/vim-github-dashboard.git'

" Multiple Plug commands can be written in a single line using | separators
Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'

" On-demand loading
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'tpope/vim-fireplace', { 'for': 'clojure' }

" Using a non-master branch
Plug 'rdnetto/YCM-Generator', { 'branch': 'stable' }

" Using a tagged release; wildcard allowed (requires git 1.9.2 or above)
Plug 'fatih/vim-go', { 'tag': '*' }

" Plugin outside ~/.vim/plugged with post-update hook
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }

" Unmanaged plugin (manually installed and updated)
Plug '~/my-prototype-plugin'

"***********************
"* Plugins added by me * 
"***********************

" A code-completion engine for Vim
Plug 'Valloric/YouCompleteMe'

" c++ code navigation
Plug 'lyuts/vim-rtags'

" Comment funtions
Plug 'scrooloose/nerdcommenter'

" Vim motion on speed
Plug 'haya14busa/incsearch.vim'

" Vim airline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" A vim plugin to display the indention levels with thin vertical lines
Plug 'Yggdroot/indentLine'

" Visually select regions
Plug 'terryma/vim-expand-region'

" Showing git status flags
Plug 'Xuyuanp/nerdtree-git-plugin'

" C family highlighting
Plug 'octol/vim-cpp-enhanced-highlight'

" Color scheme
Plug 'chriskempson/vim-tomorrow-theme'

" gocode
Plug 'nsf/gocode', { 'rtp': 'vim', 'do': '~/.vim/plugged/gocode/vim/symlink.sh' }

" Asynchronous build and test dispatcher
Plug 'tpope/vim-dispatch'

" fzf
Plug 'junegunn/fzf.vim'
Plug 'tweekmonster/fzf-filemru'

" Switch between header and source files
Plug 'derekwyatt/vim-fswitch'

" Initialize plugin system
call plug#end()

" Let vimrc change work immediately
autocmd BufWritePost $MYVIMRC source $MYVIMRC

""""""""""""""""""""""""
" Environment settings "
""""""""""""""""""""""""
" Set leader key to space
let mapleader = " "

" File type detection
filetype on

" Load plugins based on file type
filetype plugin on

" Not compatible with VI
set nocompatible

" Set session options
set sessionoptions="blank,buffers,globals,localoptions,tabpages,sesdir,folds,help,options,resize,winops,winsize"

" Keep undo history
set undodir=~/.undo_history
set undofile

""""""""""""""
" Visibility "
""""""""""""""
" Display line number
set number
noremap <F5> :set invnumber<CR>

" Display line number, the colume number, the virtual column number and the
" relative position of the cursor in the file
set ruler

" Highlighting cursor
set cursorline

" Search highlight
set hlsearch

" Switch off scroll bar
set guioptions-=l
set guioptions-=L
set guioptions-=r
set guioptions-=R

" Open a vertical split on the right side
set splitright

" Set font
set guifont=Consolas

" Syntax highlighting
syntax enable
syntax on

" Set color scheme
colorscheme Tomorrow-Night-Eighties
if has('gui_running')
    set background=light
else
    set background=dark
endif

""""""""""""""
" Formatting "
""""""""""""""
" Smart indent for different file type
filetype plugin indent on

" To insert space characters whenever the tab key is pressed 
set expandtab

" Normal tab for makefile
autocmd FileType make set noexpandtab

" Number of space characters inserted when the tab key is pressed
set tabstop=4

" Number of space characters inserted for indentation
set shiftwidth=4

" Jump cursor to the matching paren
set showmatch

"""""""""""
" Edition "
"""""""""""
" Show search results in realtime
set incsearch

" Ingore search case sensitive
set ignorecase

" Set vim command autocomplete
set wildmenu

" Copy to system clipboard
if !exists("g:os")
    let g:os = substitute(system('uname'), '\n', '', '')
endif

if g:os == "Linux"
    set clipboard=unnamedplus
else
    set clipboard=unnamed
endif

" Enable backspace
set backspace=indent,eol,start

" Automatically jump to end of text pasted
vnoremap <silent> y y`]
vnoremap <silent> p p`]
nnoremap <silent> p p`]

map <C-a> GVgg

" Shortcut for terminal-normal mode to avoid mistakenly press <Cmd-w> to close
" the terminal
" https://vimhelp.org/terminal.txt.html
tnoremap <C-n> <C-W>N

""""""""""""""
" Navigation "
""""""""""""""
" Enable mouse for window and inline navigation
set mouse=a

" Line navigation. Macbook's keyboard shortcuts fn+<Arrow> are not easy to
" press
noremap <C-Up> <PageUp>
noremap <C-Down> <PageDown>
noremap <C-Left> <Home>
noremap <C-Right> <End>

inoremap <C-Up> <PageUp>
inoremap <C-Down> <PageDown>
inoremap <C-Left> <Home>
inoremap <C-Right> <End>

" Shortcuts for split and vsplit windows to avoid to mistakenly press <Cmd-w> to close the terminal
nnoremap <C-d> <C-w>v
nnoremap <C-x> <C-w>s

" Open termdebug windows vertifcally
let g:termdebug_wide = 0

" Go back
nnoremap <S-F2> <C-o>

" GDB
nnoremap <Leader>b :Break<CR>

"""""""""""""""""""
" Plugin settings "
"""""""""""""""""""
" fzf.vim plugin settings 
" This is the default extra key bindings
let g:fzf_action = {
  \ 'ctrl-x': 'split',
  \ 'ctrl-d': 'vsplit' }

" Default fzf layout
" - down / up / left / right
let g:fzf_layout = { 'down': '~40%' }

" Customize fzf colors to match your color scheme
let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'border':  ['fg', 'Ignore'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }

" Enable per-command history.
" CTRL-N and CTRL-P will be automatically bound to next-history and
" previous-history instead of down and up. If you don't like the change,
" explicitly bind the keys to down and up in your $FZF_DEFAULT_OPTS.
let g:fzf_history_dir = '~/.local/share/fzf-history'

nnoremap <silent> <Leader>p :FilesMru --tiebreak=end<CR>
nnoremap <silent> <Leader>f :Rg<CR>
nnoremap <silent> <Leader>F :Rg <C-R><C-W><CR>

" incsearch plugin settings
map / <Plug>(incsearch-forward)
map ? <Plug>(incsearch-backward)
map g/ <Plug>(incsearch-stay)
let g:incsearch#auto_nohlsearch = 1
map <F3> <Plug>(incsearch-nohl-n)
map <S-F3> <Plug>(incsearch-nohl-N)
map * <Plug>(incsearch-nohl-*)
map # <Plug>(incsearch-nohl-#)
map g* <Plug>(incsearch-nohl-g*)
map g# <Plug>(incsearch-nohl-g#)

" Nerdtree plugin settings
nnoremap <silent> <Leader>n :NERDTreeToggle<CR>
let NERDTreeWinPos = "right"
let NERDTreeWinSize = 32
let NERDTreeShowHidden = 1
let NERDTreeAutoDeleteBuffer = 1
let NERDTreeMinimalUT = 1
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

" indentLine plugin settings
let g:indentLine_char = '¦'

" Youcompleteme plugin settings
let g:ycm_global_ycm_extra_conf = '~/.vim/.ycm_extra_conf.py'
let g:ycm_confirm_extra_conf = 0
let g:ycm_error_symbol = '>>'
let g:ycm_warning_symbol = '>*'
let g:ycm_enable_diagnostic_signs = 0
let g:ycm_enable_diagnostic_highlighting = 0

" vim-rtags plugin settings
nmap <F2> <Leader>rj

" Nerdcommenter plugin settings
let g:NERDSpaceDelims = 1
let g:NERDCompactSexyComs = 1
let g:NERDDefaultAlign = 'left'
let g:NERDAltDelims_java = 1
let g:NERDCustomDelimiters = { 'c': { 'left': '/**','right': '*/' } }
let g:NERDCommentEmptyLines = 1
let g:NERDTrimTrailingWhitespace = 1
let g:NERDCreateDefaultMappings = 0
map <Leader>/ <Plug>NERDCommenterToggle('n', 'Toggle')<CR>

" vim-cpp-enhanced-highlight plugin settings
let g:cpp_class_scope_highlight = 1
let g:cpp_member_variable_highlight = 1
let g:cpp_class_decl_highlight = 1
let g:cpp_experimental_template_highlight = 1

" vim-fswitch plugin settings
nnoremap <silent> <F4> :FSHere<CR>

" Vim-airline plugin settings
let g:airline_theme='powerlineish'
let g:airline_left_sep=''
let g:airline_right_sep=''
let g:airline_section_z=''

" Vim-expand-region
vmap v <Plug>(expand_region_expand)
vmap V <Plug>(expand_region_shrink)

" Prevent replacing paste buffer on paste (place this to end of vimrc)
" vp doesn't replace paste buffer
function! RestoreRegister()
    let @" = s:restore_reg
    return ''
endfunction
function! s:Repl()
    let s:restore_reg = @"
    return "p@=RestoreRegister()\<cr>"
endfunction
vmap <silent> <expr> p <sid>Repl()

" Vim-go plugin settings
map <C-n> :cnext<CR>
map <C-m> :cprevious<CR>
nnoremap <leader>a :cclose<CR>
autocmd FileType go nmap <leader>r <Plug>(go-run)
autocmd FileType go nmap <leader>t <Plug>(go-test)
function! s:build_go_files()
  let l:file = expand('%')
  if l:file =~# '^\f\+_test\.go$'
    call go#test#Test(0, 1)
  elseif l:file =~# '^\f\+\.go$'
    call go#cmd#Build(0)
  endif
endfunction

autocmd FileType go nmap <leader>b :<C-u>call <SID>build_go_files()<CR>
autocmd FileType go nmap <leader>c <Plug>(go-coverage-toggle)
let g:go_fmt_command = "goimports"
let g:go_highlight_types = 1
let g:go_higjlight_fields = 1
let g:go_higjlight_functions = 1
let g:go_higjlight_methods = 1
let g:go_highlight_operators = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_build_constraints = 1

autocmd Filetype go command! -bang A call go#alternate#Switch(<bang>0, 'edit')
autocmd Filetype go command! -bang AV call go#alternate#Switch(<bang>0, 'vsplit')
autocmd Filetype go command! -bang AS call go#alternate#Switch(<bang>0, 'split')
autocmd Filetype go command! -bang AT call go#alternate#Switch(<bang>0, 'tabe')

let g:go_def_mode = 'godef'
let g:go_decls_includes = "func,type"
