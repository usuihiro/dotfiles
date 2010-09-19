colorscheme evening

set clipboard=autoselect " add things to clipboard
set clipboard+=unnamed " share clipboard with windows clipboard

if has('gui_macvim')
    set columns=170
    set lines=50
    set showtabline=2  " タブを常に表示
    set imdisable      " IMを無効化
    set transparency=5 " 透明度を指定
    map <silent> gw :macaction selectNextWindow:
    map <silent> gW :macaction selectPreviousWindow:
endif

