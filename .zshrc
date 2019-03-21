[ -f ~/.zshrc.mac ] && source ~/.zshrc.mac
# screen上で最後にうったコマンドをスクリーンタイトルにする
preexec () {
          [ ${STY} ] && echo -ne "\ek${1%% *}\e\\"
}
# ターミナル起動時にscreenを起動。あればデタッチ
#[ ${STY} ] || screen -rx || screen -D -RR

autoload -U compinit
compinit

###################################
# プロンプト
case ${UID} in
0)
    PROMPT="%B%{[31m%}%/#%{[m%}%b "
    PROMPT2="%B%{[31m%}%_#%{[m%}%b "
    SPROMPT="%B%{[31m%}%r is correct? [n,y,a,e]:%{[m%}%b "
    [ -n "${REMOTEHOST}${SSH_CONNECTION}" ] &&
        PROMPT="%{[37m%}${HOST%%.*} ${PROMPT}"
    ;;
*)
    # 色付きがうまくいかない
    # PROMPT="%{[31m%}%/%%%{[m%} "
    PROMPT="%m:%n \$ "
    RPROMPT="[%~]"
    PROMPT2="%{[31m%}%_%%%{[m%} "
    SPROMPT="%{[31m%}%r is correct? [n,y,a,e]:%{[m%} "
    [ -n "${REMOTEHOST}${SSH_CONNECTION}" ] &&
        PROMPT="%{[37m%}${HOST%%.*} ${PROMPT}"
    ;;
esac

# ヒストリー関連
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt hist_ignore_dups     # ignore duplication command history list
setopt share_history        # share command history data

setopt auto_cd
setopt auto_pushd
setopt correct
setopt nolistbeep
setopt list_packed

###############################
# lsと補完のカラー設定
export LSCOLORS=exfxcxdxbxegedabagacad
export LS_COLORS='di=34:ln=35:so=32:pi=33:ex=31:bd=46;34:cd=43;34:su=41;30:sg=46;30:tw=42;30:ow=43;30'

alias ls="ls -hG"

zstyle ':completion:*' list-colors 'di=34' 'ln=35' 'so=32' 'ex=31' 'bd=46;34' 'cd=43;34'

#################################
# rvm
if [[ -s /Users/usuihirofumi/.rvm/scripts/rvm ]] ; then source /Users/usuihirofumi/.rvm/scripts/rvm ; fi

########################################
# MacVim.appのvimを使う
export EDITOR=/Applications/MacVim.app/Contents/MacOS/Vim
alias vi='env LANG=ja_JP.UTF-8 /Applications/MacVim.app/Contents/MacOS/Vim "$@"'
alias vim='env LANG=ja_JP.UTF-8 /Applications/MacVim.app/Contents/MacOS/Vim "$@"'

# この行は現在のパスを表示する設定です。ブランチを表示して色をつける設定とは関係ありません
RPROMPT="%{${fg[blue]}%}[%~]%{${reset_color}%}"

autoload -Uz vcs_info
setopt prompt_subst
zstyle ':vcs_info:git:*' check-for-changes true
zstyle ':vcs_info:git:*' stagedstr "%F{yellow}!"
zstyle ':vcs_info:git:*' unstagedstr "%F{red}+"
zstyle ':vcs_info:*' formats "%F{green}%c%u[%b]%f"
zstyle ':vcs_info:*' actionformats '[%b|%a]'
precmd () { vcs_info }
RPROMPT=$RPROMPT'${vcs_info_msg_0_}'

