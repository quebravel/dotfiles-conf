# my theme modificado de

# oh-my-zsh Bureau Theme

### NVM

ZSH_THEME_NVM_PROMPT_PREFIX="%B⬡%b "
ZSH_THEME_NVM_PROMPT_SUFFIX=""

### Git [±master ▾●]

ZSH_THEME_GIT_PROMPT_PREFIX="%{$FG[009]%}╾─╼%{$reset_color%} %{$fg_bold[green]%}±%{$reset_color%}%{$fg_bold[white]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg_bold[green]%}✓%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_AHEAD="%{$fg[cyan]%}▴%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_BEHIND="%{$fg[magenta]%}▾%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_STAGED="%{$fg_bold[green]%}●%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_UNSTAGED="%{$fg_bold[yellow]%}●%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_UNTRACKED="%{$fg_bold[red]%}●%{$reset_color%}"

### Docker Config
# The theme promt can be a whale emoji (http://emojipedia.org/spouting-whale/) or a text
#DOCKER_THEME_PROMPT=
DOCKER_THEME_PROMPT="%{$fg_bold[blue]%}Docker%{$reset_color%}"

DOCKER_LOCAL_COLOR="green"
DOCKER_REMOTE_COLOR="red"

bureau_git_branch () {
  ref=$(command git symbolic-ref HEAD 2> /dev/null) || \
  ref=$(command git rev-parse --short HEAD 2> /dev/null) || return
  echo "${ref#refs/heads/}"
}

bureau_git_status() {
  _STATUS=""

  # check status of files
  _INDEX=$(command git status --porcelain 2> /dev/null)
  if [[ -n "$_INDEX" ]]; then
    if $(echo "$_INDEX" | command grep -q '^[AMRD]. '); then
      _STATUS="$_STATUS$ZSH_THEME_GIT_PROMPT_STAGED"
    fi
    if $(echo "$_INDEX" | command grep -q '^.[MTD] '); then
      _STATUS="$_STATUS$ZSH_THEME_GIT_PROMPT_UNSTAGED"
    fi
    if $(echo "$_INDEX" | command grep -q -E '^\?\? '); then
      _STATUS="$_STATUS$ZSH_THEME_GIT_PROMPT_UNTRACKED"
    fi
    if $(echo "$_INDEX" | command grep -q '^UU '); then
      _STATUS="$_STATUS$ZSH_THEME_GIT_PROMPT_UNMERGED"
    fi
  else
    _STATUS="$_STATUS$ZSH_THEME_GIT_PROMPT_CLEAN"
  fi

  # check status of local repository
  _INDEX=$(command git status --porcelain -b 2> /dev/null)
  if $(echo "$_INDEX" | command grep -q '^## .*ahead'); then
    _STATUS="$_STATUS$ZSH_THEME_GIT_PROMPT_AHEAD"
  fi
  if $(echo "$_INDEX" | command grep -q '^## .*behind'); then
    _STATUS="$_STATUS$ZSH_THEME_GIT_PROMPT_BEHIND"
  fi
  if $(echo "$_INDEX" | command grep -q '^## .*diverged'); then
    _STATUS="$_STATUS$ZSH_THEME_GIT_PROMPT_DIVERGED"
  fi

  if $(command git rev-parse --verify refs/stash &> /dev/null); then
    _STATUS="$_STATUS$ZSH_THEME_GIT_PROMPT_STASHED"
  fi

  echo $_STATUS
}

bureau_git_prompt () {
  local _branch=$(bureau_git_branch)
  local _status=$(bureau_git_status)
  local _result=""
  if [[ "${_branch}x" != "x" ]]; then
    _result="$ZSH_THEME_GIT_PROMPT_PREFIX$_branch"
    if [[ "${_status}x" != "x" ]]; then
      _result="$_result $_status"
    fi
    _result="$_result$ZSH_THEME_GIT_PROMPT_SUFFIX"
  fi
  echo $_result
}


_PATH="%{$fg_bold[green]%}%~%{$reset_color%}"

_BAF="%{$FG[009]%}╾───────[%{$reset_color%}"

_BAR="%{$FG[009]%}]───────╼%{$reset_color%}" 

#_DA="%{$FG[009]%}%D )%{$reset_color%}"

if [[ $EUID -eq 0 ]]; then
  _USERNAME="%{$FG[009]%}┌─╼ %{$fg_bold[red]%}%n"
  _LIBERTY="%{$FG[009]%}└───╼%{$fg[red]%}#"
else
  _USERNAME="%{$FG[009]%}┌─╼ %{$fg_bold[white]%}%n"
  _LIBERTY="%{$FG[009]%}└───╼%{$fg[green]%}"
fi
_USERNAME="$_USERNAME@%{$FG[002]%}%m%{$reset_color%}"
_LIBERTY="$_LIBERTY%{$reset_color%}"


get_space () {
  local STR=$1$2
  local zero='%([BSUbfksu]|([FB]|){*})'
  local LENGTH=${#${(S%%)STR//$~zero/}}
  local SPACES=""
  (( LENGTH = ${COLUMNS} - $LENGTH - 1))

  for i in {0..$LENGTH}
    do
      SPACES="$SPACES "
    done

  echo $SPACES
}


get_docker_host() {  
 
  local _docker="$DOCKER_HOST" 
  local _docker_local="%{$fg_bold[$DOCKER_LOCAL_COLOR]%}local%{$reset_color%}"
  local _docker_remote="%{$fg_bold[$DOCKER_REMOTE_COLOR]%}$_docker%{$reset_color%}"
  local _docker_status="$_docker_remote" 

  if [[ -z "$_docker" ]]; then 
    _docker_status="$_docker_local"
  fi
  echo "($DOCKER_THEME_PROMPT : $_docker_status)"
}

_1LEFT="$_USERNAME $_BAF $_PATH $_BAR"
_1RIGHT="%{$FG[009]%}╾────╼%{$reset_color%} %* %{$FG[009]%}╾┐%{$reset_color%} "
bureau_precmd () {
  _1SPACES=`get_space $_1LEFT $_1RIGHT`
  print
  print -rP "$_1LEFT$_1SPACES$_1RIGHT"
}

setopt prompt_subst
PROMPT='$_LIBERTY '
RPROMPT='$(nvm_prompt_info) $(bureau_git_prompt) %{$FG[009]%}╾─┘%{$reset_color%}'

autoload -U add-zsh-hook
add-zsh-hook precmd bureau_precmd
