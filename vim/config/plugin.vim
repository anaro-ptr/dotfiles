"==========================================================
" plugin.vim.
"==========================================================
" {{{

filetype off
" 実行時のパスにneobundleを追加する
set rtp+=$HOME/.vim/bundle/neobundle.vim/

call neobundle#begin(expand('$HOME/.vim/bundle'))
" NeoBundleが管理するプラグイン
NeoBundleFetch 'Shougo/neobundle.vim'
NeoBundle 'Shougo/vimproc', {
	\ 'build' : {
		\ 'windows' : 'echo "Sorry, cannot update vimproc binary file in Windows."',
		\ 'cygwin' : 'make -f make_cygwin.mak',
		\ 'mac' : 'make -f make_mac.mak',
		\ 'unix' : 'make -f make_unix.mak',
	\ },
\ }
if has('lua')
	NeoBundle 'Shougo/neocomplete'
endif
NeoBundle 'Shougo/vimshell'
NeoBundle 'thinca/vim-quickrun'
NeoBundle 'Shougo/unite.vim'
NeoBundle 'rhysd/git-messenger.vim'
NeoBundle 'tpope/vim-dispatch'

NeoBundleLazy 'marcus/rsense', {
	\ 'autoload' : {
		\ 'filetype' : 'ruby',
	\ },
\ }

NeoBundle 'supermomonga/neocomplete-rsense.vim', {
	\ 'depends' : ['Shougo/neocomplete.vim', 'marcus/rsense'],
\ }

NeoBundleLazy 'nosami/Omnisharp', {
	\ 'autoload': { 'filetypes': ['cs'] },
	\ 'build': {
		\ 'windows': 'MSBuild.exe server/OmniSharp.sln /p:Platform="Any CPU"',
		\ 'mac': 'xbuild server/OmniSharp.sln',
		\ 'unix': 'xbuild server/OmniSharp.sln',
	\ }
\ }
call neobundle#end()

nnoremap <silent> <Leader>nbi :<C-u>NeoBundleInstall<CR>
nnoremap <silent> <Leader>nbu :<C-u>NeoBundleUpdate<CR>
nnoremap <silent> <Leader>nbc :<C-u>NeoBundleClean<CR>

" rsense
let g:rsenseUseOmniFunc = 1

" neocomplete
if neobundle#is_installed('neocomplete')
	" Disable AutoComplPop.
	let g:acp_enableAtStartup = 0
	" Use neocomplete.
	let g:neocomplete#enable_at_startup = 1
	" Use smartcase.
	let g:neocomplete#enable_smart_case = 1
	" Set minimum syntax keyword length.
	let g:neocomplete#sources#syntax#min_keyword_length = 3
	let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'
	" Define dictionary.
	let g:neocomplete#sources#dictionary#dictionaries = {
		\ 'default' : '',
		\ 'vimshell' : $HOME.'/.vimshell_hist',
		\ 'scheme' : $HOME.'/.gosh_completions'
	\ }
	" Define keyword.
	if !exists('g:neocomplete#keyword_patterns')
		let g:neocomplete#keyword_patterns = {}
	endif
	let g:neocomplete#keyword_patterns['default'] = '\h\w*'
	" Plugin key-mappings.
	inoremap <expr><C-g> neocomplete#undo_completion()
	inoremap <expr><C-l> neocomplete#complete_common_string()
	" Recommended key-mappings.
	" <CR>: close popup and save indent.
	inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
	function! s:my_cr_function()
		return neocomplete#close_popup() . "\<CR>"
	endfunction
	" <TAB>: completion.
	inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
	" <C-h>, <BS>: close popup and delete backword char.
	inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
	inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
	inoremap <expr><C-y>  neocomplete#close_popup()
	inoremap <expr><C-e>  neocomplete#cancel_popup()
	" Enable omni completion.
	autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
	autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
	autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
	autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
	autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
	autocmd FileType cs setlocal omnifunc=OmniSharp#Complete
	" Enable heavy omni completion.
	if !exists('g:neocomplete#sources#omni#input_patterns')
	    let g:neocomplete#sources#omni#input_patterns = {}
	endif
	let g:neocomplete#sources#omni#input_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'
	let g:neocomplete#sources#omni#input_patterns.cs = '.*[^=\);]'
	if !exists('g:neocomplete#force_omni_input_patterns')
		let g:neocomplete#force_omni_input_patterns = {}
	endif
	let g:neocomplete#force_omni_input_patterns.ruby = '[^. *\t]\.\w*\|\h\w*::'
endif

"----------------------------------------------------------
" unite.vim
"----------------------------------------------------------
" {{{

nnoremap [unite] <Nop>
" macvimで<Leader>を打つためには、alt+¥になるので","にした
nmap ,f [unite]

nnoremap [unite]u :<C-u>Unite -no-split<Space>
nnoremap <silent> [unite]f :<C-u>Unite<Space>buffer<CR>
nnoremap <silent> [unite]b :<C-u>Unite<Space>bookmark<CR>
nnoremap <silent> [unite]m :<C-u>Unite<Space>file_mru<CR>
nnoremap <silent> [unite]r :<C-u>UniteWithBufferDir file<CR>
nnoremap <silent> ,vr :UniteResume<CR>

let g:vinarise_enable_auto_detect = 1

" unite-build map
nnoremap <silent> ,vb :Unite build<CR>
nnoremap <silent> ,vcb :Unite build:!<CR>
nnoremap <silent> ,vch :UniteBuildClearWithHighlight<CR>

" }}}

"----------------------------------------------------------
" git-messenger.vim
"----------------------------------------------------------
" {{{

" macvim向けにしてみたけど動かない？
if has('gui_macvim')
	nnoremap <silent> ,s :<C-u>call gitmessenger#echo()<CR>
endif
nnoremap <silent> ,c :<C-u>echo gitmessenger#commit_message(expand('%'), line('.'))<CR>

" }}}

" }}}
