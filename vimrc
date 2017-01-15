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

" Plugin options
Plug 'nsf/gocode', { 'tag': 'v.20150303', 'rtp': 'vim' }

" Plugin outside ~/.vim/plugged with post-update hook
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }

" Unmanaged plugin (manually installed and updated)
Plug '~/my-prototype-plugin'

" A class outline viewer for Vim
Plug 'majutsushi/tagbar'

" A code-completion engine for Vim
Plug 'Valloric/YouCompleteMe'

" Additional Vim C++ syntax highlight
Plug 'octol/vim-cpp-enhanced-highlight'

" Comment funtions
Plug 'scrooloose/nerdcommenter'

" Initialize plugin system
call plug#end()

" File type detection
filetype plugin on

" Not compatible with VI
set nocompatible

" Display line number
set number

" Toggle line number
nnoremap <F1> :set nonumber!<CR>

" To insert space characters whenever the tab key is pressed 
set expandtab

" Number of space characters inserted when the tab key is pressed
set tabstop=4
set softtabstop=4

" Number of space characters inserted for indentation
set shiftwidth=4

" Ignore case sensitive
set ic

" Search highlight
set hlsearch

" Show search results in realtime
set incsearch

" Toggle search highlight
nnoremap <silent> <F8> :set hlsearch!<CR>

" Display line number, the colume number, the virtual column number and the
" relative position of the cursor in the file
set ruler

" Jump cursor to the matching paren
set showmatch

" Copy to system clipboard
set clipboard=unnamed

" Normal tab for makefile
autocmd FileType make set noexpandtab

" Jump to end of line in insert mode
inoremap <C-e> <Esc>A

" Jump to beginning of line in insert mode
inoremap <C-a> <Esc>I

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

" Nerdtree plugin settings
nnoremap <silent> <F2> :NERDTreeToggle<CR>

" Nerdtree-git plugin settings
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

" Tagbar plugin settings
nmap <silent> <F3> :TagbarToggle<CR>
let g:tagbar_ctags_bin = '/usr/local/bin/ctags'
let g:tagbar_width = 30

" Cpp-enhanced-highlight plugin settings
let g:cpp_class_scope_highlight = 1
let g:cpp_experimental_template_highlight = 1

" Easymotion plugin settings
let g:EasyMotion_leader_key = '<Space>'
"map  <Leader>f <Plug>(easymotion-bd-f)
"nmap <Leader>f <Plug>(easymotion-overwin-f)
"nmap s <Plug>(easymotion-overwin-f2)
"map <Leader>L <Plug>(easymotion-bd-jk)
"nmap <Leader>L <Plug>(easymotion-overwin-line)
"map  <Leader>w <Plug>(easymotion-bd-w)
"nmap <Leader>w <Plug>(easymotion-overwin-w)

" Youcompleteme plugin settings
let g:ycm_global_ycm_extra_conf = '~/.vim/.ycm_extra_conf.py'
let g:ycm_confirm_extra_conf = 0
let g:ycm_error_symbol = '>>'
let g:ycm_warning_symbol = '>*'
nnoremap <Leader>] :YcmCompleter GoTo<CR>
nnoremap <Leader>gi :YcmCompleter GoToInclude<CR>
nnoremap <Leader>gd :YcmCompleter GoToDeclaration<CR>
nnoremap <Leader>gf :YcmCompleter GoToDefinition<CR>
nnoremap <Leader>ge :YcmCompleter GoToDefinitionElseDeclaration<CR>
nmap <F4> :YcmDiags<CR>

" Vim-cpp-enhanced-highlight settings
let g:cpp_class_scope_hightlight = 1
let g:cpp_experimental_template_highlight = 1

" Nerdcommenter plugin settings
let g:NERDSpaceDelims = 1
let g:NERDCompactSexyComs = 1
let g:NERDDefaultAlign = 'left'
let g:NERDAltDelims_java = 1
let g:NERDCustomDelimiters = { 'c': { 'left': '/**','right': '*/' } }
let g:NERDCommentEmptyLines = 1
let g:NERDTrimTrailingWhitespace = 1
