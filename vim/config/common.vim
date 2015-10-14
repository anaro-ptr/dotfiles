"==========================================================
" common.vim
"==========================================================
" {{{

" エンコード云々
set encoding=utf-8 fileencodings=utf-8,ucs-bom,iso-2022-jp,euc-jp,cp932
set fileformat=unix fileformats=unix,dos,mac

" vi互換offにする
set nocompatible

" シンタックスハイライトを有効化する
syntax on
" 行番号を表示する
set number
" 空白・改行文字を表示する
set list
" 空白・改行文字が表示される場合の文字を指定
set listchars=tab:>-,trail:-,eol:\
" タブ幅の指定
set tabstop=4
set shiftwidth=4
" 改行した際にインデント位置を同じにする
set autoindent
filetype plugin indent on
set nocindent
" Cスタイルのインデントを有効にする
set cindent
" autoindentを賢く
set smartindent
" 改行した際にコメントを挿入しないようにする
autocmd FileType * setlocal formatoptions-=ro
" Undo回数の指定
set undolevels=2000
" 括弧を入力した時にカーソルが移動しないようにする
set matchtime=0
" backspace を indent, eol, start を超えて有効にする
set backspace=indent,eol,start
" カーソルが行頭、行末で止まらないようにする
set whichwrap=b,s,h,l,<,>,[,]
" 外部からのファイル書き換えを検出した場合に自動読込
set autoread
" コマンドの内容をステータス行に表示
set showcmd
" ファイル名補完をシェルと同様に
set wildmode=list:longest
" 検索結果のハイライト
set hlsearch
" 検索時の大文字小文字を区別しない
set ignorecase
" 検索する文字に大文字が１つでも入っていた場合は、大文字小文字を区別する
set smartcase

" 現在のモードを表示
set showmode
" ステータスバーを常時表示
set laststatus=2
" 右下に情報を出す
set ruler

" 横分割したら新しいウィンドウは下に
set splitbelow
" 縦分割したら新しいウィンドウは右に
set splitright

" カーソルハイライト横
set cursorline
" カーソルハイライト縦
set cursorcolumn

" ビープ音消去
set visualbell t_vb=

" マウス有効化
set mouse=nch
set ttymouse=xterm2
set nu
set clipboard+=autoselect

" 起動時のメッセージを表示しない
set shortmess& shortmess+=I

" 背景色を黒に設定する
set background=dark
" カラースキーマを変更する
colorscheme desert

" MacVimに向けた設定
if has( 'gui_macvim' )
	set transparency=3
	" MBAのデスクトップで最大表示になる
	set columns=204
	set lines=51
	set guioptions-=T
endif

" Rubyの空白文字幅
au BufNewFile,BufRead *.rb,*.rake,*.haml,*.erb,*.slim,Gemfile set nowrap tabstop=2 shiftwidth=2 expandtab

" }}}
