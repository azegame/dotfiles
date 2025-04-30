#Ruby
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"

#PostgreSQL
export PATH="/opt/homebrew/opt/postgresql@14/bin:$PATH"

# PATH
#export PATH=$HOME/.nodebrew/current/bin:$PATH
#export PATH="/usr/local/opt/node@20/bin:$PATH"

# git-prompt.sh
# addされていない変更を「*」commitされていない変更を「+」で示す
GIT_PS1_SHOWDIRTYSTATE=true
# addされていない新規ファイルの存在を「%」で示す
GIT_PS1_SHOWUNTRACKEDFILES=true
# stashがある場合は「$」で示す
GIT_PS1_SHOWSTASHSTATE=true
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
PS1='%F{green}%n@%m%f %F{magenta}%c%f$(set_branch_info) %F{green}%%%f '

# alias 
alias ls='ls -G'
alias ll='ls -lG'
alias la='ls -laG'

export LSCOLORS=gxfxcxdxbxegedabagacad

autoload -Uz compinit
compinit
