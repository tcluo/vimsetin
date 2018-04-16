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
" A class outline viewer for Vim
Plug 'majutsushi/tagbar'

" A code-completion engine for Vim
Plug 'Valloric/YouCompleteMe'

" Comment funtions
Plug 'scrooloose/nerdcommenter'

" Full path fuzzy finder for Vim
Plug 'ctrlpvim/ctrlp.vim'

" Vim motion on speed
Plug 'easymotion/vim-easymotion'

" Vim airline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Color scheme
Plug 'altercation/vim-colors-solarized'

" A vim plugin to display the indention levels with thin vertical lines
Plug 'Yggdroot/indentLine'

" Visually select regions
Plug 'terryma/vim-expand-region'

" Showing git status flags
Plug 'Xuyuanp/nerdtree-git-plugin'

" C++ highlighting
Plug 'octol/vim-cpp-enhanced-highlight'

" Color scheme
Plug 'fatih/molokai'

" Fast and easy find and replace across multiple files
Plug 'dkprice/vim-easygrep'

" gocode
Plug 'nsf/gocode', { 'rtp': 'vim', 'do': '~/.vim/plugged/gocode/vim/symlink.sh' }

" Asynchronous build and test dispatcher
Plug 'tpope/vim-dispatch'

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

" Save session hotkey
map <leader>ss :mksession! my.vim<CR> :wviminfo! my.viminfo<CR>

" Resume session hotkey
map <leader>rs :source my.vim<CR> :rviminfo my.viminfo<CR>

""""""""""""""
" Visibility "
""""""""""""""
" Display line number
set number

" Display line number, the colume number, the virtual column number and the
" relative position of the cursor in the file
set ruler

" Highlighting cursor
set cursorline

" Search highlight
set hlsearch

" Toggle search highlight
nnoremap <silent> <F8> :set hlsearch!<CR>

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
set background=dark
"colorscheme solarized
colorscheme molokai
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
set clipboard=unnamed

" Enable backspace
set backspace=indent,eol,start

" Automatically jump to end of text pasted
vnoremap <silent> y y`]
vnoremap <silent> p p`]
nnoremap <silent> p p`]

""""""""""""""
" Navigation "
""""""""""""""
" Window splits navigation
nnoremap <Leader><Up> <c-w>k
nnoremap <Leader><Down> <c-w>j
nnoremap <Leader><Left> <c-w>h
nnoremap <Leader><Right> <c-w>l

" Auto search tag file
set tags=./tags,tags;$HOME

" Cscope auotloading
function! LoadCscope()
  let db = findfile("cscope.out", ".;")
  if (!empty(db))
    let path = strpart(db, 0, match(db, "/cscope.out$"))
	set nocscopeverbose " suppress 'duplicate connection' error
	exe "cs add " . db . " " . path
	set cscopeverbose
  endif
endfunction
au BufEnter /* call LoadCscope()
set cscopequickfix=s-,c-,d-,i-,t-,e-
augroup qf
	autocmd!
	autocmd QuickFixCmdPost * cwindow
augroup END

"""""""""""""""""""
" Plugin settings "
"""""""""""""""""""
" Nerdtree plugin settings
nmap <silent> <Leader>n :NERDTreeToggle<CR>
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

" Tagbar plugin settings
nmap <silent> <Leader>t :TagbarToggle<CR>
let tagbar_left = 1
let g:tagbar_ctags_bin = '/usr/local/bin/ctags'
let g:tagbar_width = 32 
let g:tagbar_compact=1
let g:tagbar_type_cpp = {
     \ 'kinds' : [
            \ 'c:classes:0:1',
            \ 'd:macros:0:1',
            \ 'e:enumerators:0:0', 
            \ 'f:functions:0:1',
            \ 'g:enumeration:0:1',
            \ 'l:local:0:1',
            \ 'm:members:0:1',
            \ 'n:namespaces:0:1',
            \ 'p:functions_prototypes:0:1',
            \ 's:structs:0:1',
            \ 't:typedefs:0:1',
            \ 'u:unions:0:1',
            \ 'v:global:0:1',
            \ 'x:external:0:1'
    \ ],
    \ 'sro' : '::',
    \ 'kind2scope' : {
            \ 'g' : 'enum',
            \ 'n' : 'namespace',
            \ 'c' : 'class',
            \ 's' : 'struct',
            \ 'u' : 'union'
    \ },
    \ 'scope2kind' : {
            \ 'enum' : 'g',
            \ 'namespace' : 'n',
            \ 'class' : 'c',
            \ 'struct' : 's',
            \ 'union' : 'u'
    \ }
\ }

" Easymotion plugin settings
map / <Plug>(easymotion-sn)
map n <Plug>(easymotion-next)
map N <Plug>(easymotion-prev)

" Youcompleteme plugin settings
let g:ycm_global_ycm_extra_conf = '~/.vim/.ycm_extra_conf.py'
let g:ycm_confirm_extra_conf = 0
let g:ycm_error_symbol = '>>'
let g:ycm_warning_symbol = '>*'
let g:ycm_enable_diagnostic_signs = 0
let g:ycm_enable_diagnostic_highlighting = 0
nnoremap <Leader>] :YcmCompleter GoTo<CR>
nnoremap <Leader>gi :YcmCompleter GoToInclude<CR>
nnoremap <Leader>gd :YcmCompleter GoToDeclaration<CR>
nnoremap <Leader>gf :YcmCompleter GoToDefinition<CR>
nnoremap <Leader>ge :YcmCompleter GoToDefinitionElseDeclaration<CR>
nmap <F4> :YcmDiags<CR>

" Nerdcommenter plugin settings
let g:NERDSpaceDelims = 1
let g:NERDCompactSexyComs = 1
let g:NERDDefaultAlign = 'left'
let g:NERDAltDelims_java = 1
let g:NERDCustomDelimiters = { 'c': { 'left': '/**','right': '*/' } }
let g:NERDCommentEmptyLines = 1
let g:NERDTrimTrailingWhitespace = 1

" Ctrlp plugin settings
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlPMixed'
nnoremap <Leader>o :CtrlPMixed<CR>
let g:ctrlp_working_path_mode = 'ra'
set wildignore+=*/tmp/*,*.so,*.swp,*.zip
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']
let g:ctrlp_reuse_window = 'startify'
let g:ctrlp_use_caching = 0
if executable('ag')
        set grepprg=ag\ --nogroup\ --nocolor

            let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
        else
              let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files . -co --exclude-standard', 'find %s -type f']
                let g:ctrlp_prompt_mappings = {
                    \ 'AcceptSelection("e")': ['<space>', '<cr>', '<2-LeftMouse>'],
                    \ }
            endif

" vim-fswitch plugin settings
nmap <silent> <Leader>sw :FSHere<CR>

" Solorized plugin settings
let g:solarized_termtrans = 1

" Molokai plugin settings
let g:molokai_original = 1
let g:rehash256 = 1

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
