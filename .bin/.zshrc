#Ruby
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"

export LC_CTYPE=ja_JP.UTF-8
export LANG=ja_JP.UTF-8

# MySQL
export PATH="/opt/homebrew/opt/mysql@8.0/bin:$PATH"

export LDFLAGS="-L/opt/homebrew/opt/mysql@8.0/lib"
export CPPFLAGS="-I/opt/homebrew/opt/mysql@8.0/include"
export PKG_CONFIG_PATH="/opt/homebrew/opt/mysql@8.0/lib/pkgconfig"

#PostgreSQL
export PATH="/opt/homebrew/opt/postgresql@14/bin:$PATH"

# Node.js
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# homebrewでインストールした Node.js v20（不要）
#export PATH="/usr/local/opt/node@20/bin:$PATH"

################################################################################

function gitmain() {
  git config --global user.name "azegame"
  git config --global user.email "a.masashi218@gmail.com"
}

function gitrdev() {
  git config --global user.name "m-azegami-rdev"
  git config --global user.email "m-azegami@ruby-dev.jp"
}

# git-prompt.sh
# addされていない変更を「*」commitされていない変更を「+」で示す
GIT_PS1_SHOWDIRTYSTATE=true
# addされていない新規ファイルの存在を「%」で示す
GIT_PS1_SHOWUNTRACKEDFILES=true
# stashがある場合は「$」で示す
GIT_PS1_SHOWSTASHSTATE=false
# upstreamと同期「=」進んでいる「>」遅れている「<」で示す
GIT_PS1_SHOWUPSTREAM=auto

source ~/.zsh/git-prompt.sh

# git ブランチ情報を返す関数
function set_branch_info() {
  local branch=$(__git_ps1 "(%s)")
  if [[ -n "$branch" ]]; then
    # ブランチ情報があるときのみ、先頭にスペースを含めて返す
    echo " $(git_color)${branch}"
  fi
}

function git_color() {
  local git_info="$(__git_ps1 "%s")"
  if [[ $git_info == *"%"* ]]; then
    # 未追跡ファイルがあるとき → 緑
    echo '%F{green}'
  elif [[ $git_info == *"*"* ]] || [[ $git_info == *"+"* ]]; then
    # ステージ前変更 (*) または ステージ済 (+) → 黄
    echo '%F{yellow}'
  else
    echo '%F{cyan}'
  fi
}

# prompt
setopt PROMPT_SUBST
PS1='%F{green}%n%f%F{magenta}<`git config user.name`>%f%F{green}@%m%f %F{magenta}%c%f$(set_branch_info) %F{green}%%%f '

# alias
alias ll='ls -laG'

export LSCOLORS=gxfxcxdxbxegedabagacad

autoload -Uz compinit
compinit

# ヒストリの設定
HISTFILE=~/.zsh_history
HISTSIZE=50000
SAVEHIST=50000

# 直前のコマンドと同じものは記録しない（連続重複を無視）
setopt hist_ignore_dups

# 履歴全体から重複コマンドを削除し、常に最新の１回だけを残す
setopt hist_ignore_all_dups

# コマンド実行後すぐに、その１行だけを履歴ファイルに追記する
setopt inc_append_history
