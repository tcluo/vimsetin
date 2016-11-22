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

set clipboard=unnamed

"Normal tab for makefile
autocmd FileType make set noexpandtab

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
"color_coded setting
let g:color_coded_enabled = 1
let g:color_coded_filetypes = ['c', 'cpp']

"tab operation
"nnoremap <C-[> :tabprevious<CR>
"nnoremap <C-]> :tabnext<CR>

" youcompleteme plugin setting
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

" ListToggle setting
let g:lt_location_list_toggle_map = '<leader>l'
let g:lt_quickfix_list_toggle_mape = '<leader>q'
let g:lt_height = 10

" syntastic
"set statusline+=%#warningmsg#
"set statusline+=%{SyntasticStatuslineFlag()}
"set statusline+=%*
"let g:syntastic_always_populate_loc_list = 1
"let g:syntastic_auto_loc_list = 1
"let g:syntastic_check_on_open = 1
"let g:syntastic_check_on_wq = 0
