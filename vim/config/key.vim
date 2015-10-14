"==========================================================
" key.vim
" 
" キーマッピングに関する設定を記述
"==========================================================

"----------------------------------------------------------
" ノーマルモード
"----------------------------------------------------------
" {{{

" Esc2回で検索ハイライト解除
nnoremap <silent> <Esc><Esc> :noh<CR>

" xで削除した時にレジスタに乗せない
nnoremap x "_x
nnoremap X "_X

" C-cでタブを新規に開く
nnoremap <silent> <C-c> :tabnew<CR>

" 語句の頭から囲う
nmap S ys$
" 語句の中腹から囲う
nmap yS yss
" 囲い文字を削除する
nmap dS ds

" }}}

"----------------------------------------------------------
" Use MacVim
"----------------------------------------------------------
" {{{

if has('gui_macvim')
	" 自然に<Leader>を入力する
	nmap ¥ <Leader>
endif

" }}}