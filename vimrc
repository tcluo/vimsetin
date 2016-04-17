execute pathogen#infect()
syntax on
filetype plugin on
filetype plugin indent on
set nocompatible
set number
set tabstop=4
set shiftwidth=4
set softtabstop=4
set showmatch
set guifont=Source_Code_Pro:h14
set hlsearch

"set background=dark
"colorscheme desert_thl

"jump to end of line in insert mode
inoremap <C-e> <Esc>A
"jump to beginning of line in insert mode
inoremap <C-a> <Esc>I

"tag file path
set tags=./tags,tags;$HOME
"cscope auotloading
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
"nerdtree plugin setting
nnoremap <silent> <F2> :NERDTreeToggle<CR>
"nerdtree-git plugin setting
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
"tagbar plugin setting
nmap <silent> <F3> :TagbarToggle<CR>
let g:tagbar_ctags_bin = '/usr/local/bin/ctags'
let g:tagbar_width = 30
"cpp-enhanced-highlight plugin setting
let g:cpp_class_scope_highlight = 1
let g:cpp_experimental_template_highlight = 1
"easymotion plugin setting
let g:EasyMotion_leader_key = '<Space>'
"map  <Leader>f <Plug>(easymotion-bd-f)
"nmap <Leader>f <Plug>(easymotion-overwin-f)
"nmap s <Plug>(easymotion-overwin-f2)
"map <Leader>L <Plug>(easymotion-bd-jk)
"nmap <Leader>L <Plug>(easymotion-overwin-line)
"map  <Leader>w <Plug>(easymotion-bd-w)
"nmap <Leader>w <Plug>(easymotion-overwin-w)
"toggle search highlight
nnoremap <silent> <F8> :set hlsearch!<CR>
"dwm plugin setting
set mouse=a "enable the use of the mouse in all modes

