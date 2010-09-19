syntax on
set nu
set expandtab
set tabstop=4
set shiftwidth=4

set nobackup

map <C-n> :cn<CR>
map <C-p> :cp<CR>

map <C-\>^] :GtagsCursor<CR>

set nocompatible

nnoremap k gk
nnoremap j gj

set enc=utf-8
set fenc=utf-8
set fencs=utf-8,iso-2022-jp,euc-jp,cp932

set hls

"howmの設定
"QFixHowmキーマップ
let QFixHowm_Key = 'g'

"howm_dirはファイルを保存したいディレクトリを設定。
let howm_dir             = '~/howm'
let howm_filename        = '%Y/%m/%Y-%m-%d.howm'
let howm_fileencoding    = 'utf-8'
let howm_fileformat      = 'unix'

" QFixGrepのキーマップ
nnoremap c,e  :Grep!<CR>
nnoremap c,f  :FGrep!<CR>
nnoremap c,v  :VGrep!<CR>
nnoremap c,b  :BGrep<CR>
"ヤンクした文字列でgrep
nnoremap c,rf :exec 'FGrep! '. expand(@0)<CR>
nnoremap c,rv :exec 'VGrep! '. expand(@0)<CR>
"選択中の文字列でgrep
vmap c,f  vgvyg,rf
vmap c,v  vgvyg,rv

filetype plugin indent on " Enable filetype-specific indenting and plugins
"command -bar -nargs=1 OpenURL :!open -a Firefox <args>

autocmd FileType ruby,eruby let g:rubycomplete_buffer_loading = 1
autocmd FileType ruby,eruby let g:rubycomplete_rails = 1
autocmd FileType ruby,eruby let g:rubycomplete_classes_in_global = 1

"<Leader>xでコメントをトグル(NERD_commenter.vim:
map <Leader>x ,c<space>
"未対応ファイルタイプのエラーメッセージを表示しない
let NERDShutUp=1

"
" FuzzyFinderのマッピング。
"
"nmap <unique> <silent> <C-b> :FuzzyFinderBuffer<CR>
"nmap <unique> <silent> <C-f> :FuzzyFinderFile<CR>
set showtabline=2

" Tabs
nnoremap <Space>t t
nnoremap <Space>T T
nnoremap t <Nop>
nnoremap <silent> tc :<C-u>tabnew<CR>:tabmove<CR>
nnoremap <silent> tk :<C-u>tabclose<CR>
nnoremap <silent> tn :<C-u>tabnext<CR>
nnoremap <silent> tp :<C-u>tabprevious<CR>

" FuzzyFinder.vim
nnoremap <Space>f f
nnoremap <Space>F F
nnoremap f <Nop>
nnoremap <silent> fb :<C-u>FufBuffer!<CR>
nnoremap <silent> ff :<C-u>FufFile! <C-r>=expand('%:~:.')[:-1-len(expand('%:~:.:t'))]<CR><CR>
nnoremap <silent> fm :<C-u>FufMruFile!<CR>
nnoremap <silent> tb :<C-u>tabnew<CR>:tabmove<CR>:FufBuffer!<CR>
nnoremap <silent> tf :<C-u>tabnew<CR>:tabmove<CR>:FufFile! <C-r>=expand('#:~:.')[:-1-len(expand('#:~:.:t'))]<CR><CR>
nnoremap <silent> tm :<C-u>tabnew<CR>:tabmove<CR>:FufMruFile!<CR>

let g:neocomplcache_enable_at_startup=1
