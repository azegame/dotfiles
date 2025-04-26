" カラースキーム
colorscheme molokai

" 行番号を表示
set number
" シンタックスハイライト
syntax on
" 入力モードでTabキー押下時に半角スペースを挿入
set expandtab
" 新しい行のインデントを現在行と同じくする
set autoindent
" インデント幅
set shiftwidth=2
" タブキー押下時に挿入される文字幅を指定
set softtabstop=2
" ファイル内にあるタブ文字の表示幅
set tabstop=2
" 対応する括弧を強調表示
set showmatch
" 改行時に入力された行の末尾に合わせて次の行のインデントを増減する
set smartindent
" スワップファイルを作成しない
set noswapfile
" ステータスバー常に表示
set laststatus=2

"----------------------------------------
" 検索
"----------------------------------------
" 検索するときに大文字小文字を区別しない
set ignorecase
" 検索パターンが大文字を含んでいたらオプション 'ignorecase' を上書きする。
set smartcase
" 検索がファイル末尾まで進んだら、ファイル先頭から再び検索
set wrapscan
" インクリメンタル検索 (検索ワードの最初の文字を入力した時点で検索が開始)
set incsearch
" 検索結果をハイライト表示
set hlsearch
