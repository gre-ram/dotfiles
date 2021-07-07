################################
###########  Basic  ############
################################
if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init -)"
fi


source ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
export CLICOLOR=1
autoload -U colors && colors

setopt AUTO_CD                 # [default] .. is shortcut for cd .. (etc)
setopt AUTO_PARAM_SLASH        # tab completing directory appends a slash
setopt AUTO_PUSHD              # [default] cd automatically pushes old dir onto dir stack
setopt AUTO_RESUME             # allow simple commands to resume backgrounded jobs
setopt GLOB_DOTS               # .dotfiles 
setopt CORRECT                 # [default] command auto-correction
setopt CORRECT_ALL             # [default] argument auto-correction
setopt NO_FLOW_CONTROL         # disable start (C-s) and stop (C-q) characters
setopt LIST_PACKED             # make completion lists more densely packed
setopt NO_NOMATCH              # [default] unmatched patterns are left unchanged
setopt PUSHD_IGNORE_DUPS       # don't push multiple copies of same dir onto stack
setopt PUSHD_SILENT            # [default] don't print dir stack after pushing/popping
setopt PROMPT_SUBST            # Allow for functions in the prompt.
setopt no_prompt_bang
setopt prompt_percent
setopt NO_CASE_GLOB            # Case Insensitive Globbing

alias g2code="~/Code"
alias g2vimrc="vim ~/dotfiles/Neovim/.config/nvim/init.vim"
alias g2zshrc="vim ~/dotfiles/zsh/.zshrc"
alias g2pdfs="~/Documents/myBib/pdfs"
alias g2Konspekte="~/Documents/myBib/Konspekte"

alias emacs="emacsclient -n"

alias latex-update="sudo tlmgr update --self --all"

alias ynab="Rscript ~/code/dkb-ynab/myaccounts.R"

alias g='git'
alias ga='git add'
alias gaa='git add --all'
alias gc='git commit -v'
alias gcl='git clone --recurse-submodules'
alias gd='git diff'
alias gss='git status -s'
alias gst='git status'
alias gsurr='git submodule update --recursive --remote'

alias vi='nvim'
alias vim='nvim'

alias lsa='gls -la'
alias l='ls -la'
alias ll='ls -l'
alias la='ls -lA'
alias -g ...='../..'
alias -g ....='../../..'
alias -g .....='../../../..'
alias -g ......='../../../../..'

################################
########### Bindings ###########
################################
bindkey -v
bindkey -M vicmd 'v' edit-command-line
# Use "cbt" capability ("back_tab", as per `man terminfo`), if we have it:
if tput cbt &> /dev/null; then
  bindkey "$(tput cbt)" reverse-menu-complete # make Shift-tab go to previous completion
fi

autoload -U edit-command-line
zle -N edit-command-line
bindkey -M vicmd 'v' edit-command-line


# Make CTRL-Z background things and unbackground them.
function fg-bg() {
  if [[ $#BUFFER -eq 0 ]]; then
    fg
  else
    zle push-input
  fi
}
zle -N fg-bg
bindkey '^Z' fg-bg

################################
########## Completion ##########
################################
autoload -Uz compinit && compinit
autoload bashcompinit && bashcompinit
zstyle ':completion:*' list-suffixes
zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'
zstyle ':completion:*' expand prefix suffix
zstyle ':completion:*' list-colors ''
zstyle ':completion:*' menu select
# exceptions to auto-correction
alias bundle='nocorrect bundle'
alias cabal='nocorrect cabal'
alias man='nocorrect man'
alias mkdir='nocorrect mkdir'
alias mv='nocorrect mv'
alias stack='nocorrect stack'
alias sudo='nocorrect sudo'


################################
############ Prompt ############
################################
source ~/.zsh/gitstatus/gitstatus.plugin.zsh
function my_git_prompt() {
      emulate -L zsh
      typeset -g  GITSTATUS_PROMPT=''
      typeset -gi GITSTATUS_PROMPT_LEN=0
      # Call gitstatus_query synchronously. Note that gitstatus_query can also be called
      # asynchronously; see documentation in gitstatus.plugin.zsh.
      gitstatus_query 'MY'                  || return 1  # error
      [[ $VCS_STATUS_RESULT == 'ok-sync' ]] || return 0  # not a git repo
      local      clean='%F{green}'   # green foreground
      local   modified='%F{yellow}'  # yellow foreground
      local  untracked='%F{blue}'   # blue foreground
      local conflicted='%F{red}'  # red foreground
      local p
      local where  # branch name, tag or commit
      if [[ -n $VCS_STATUS_LOCAL_BRANCH ]]; then
        where=$VCS_STATUS_LOCAL_BRANCH
      elif [[ -n $VCS_STATUS_TAG ]]; then
        p+='%f#'
        where=$VCS_STATUS_TAG
      else
        p+='%f@'
        where=${VCS_STATUS_COMMIT[1,8]}
      fi
      (( $#where > 32 )) && where[13,-13]="…"  # truncate long branch names and tags
      p+="${clean}${where//\%/%%}"             # escape %
      # ⇣42 if behind the remote.
      (( VCS_STATUS_COMMITS_BEHIND )) && p+=" ${clean}⇣${VCS_STATUS_COMMITS_BEHIND}"
      # ⇡42 if ahead of the remote; no leading space if also behind the remote: ⇣42⇡42.
      (( VCS_STATUS_COMMITS_AHEAD && !VCS_STATUS_COMMITS_BEHIND )) && p+=" "
      (( VCS_STATUS_COMMITS_AHEAD  )) && p+="${clean}⇡${VCS_STATUS_COMMITS_AHEAD}"
      # ⇠42 if behind the push remote.
      (( VCS_STATUS_PUSH_COMMITS_BEHIND )) && p+=" ${clean}⇠${VCS_STATUS_PUSH_COMMITS_BEHIND}"
      (( VCS_STATUS_PUSH_COMMITS_AHEAD && !VCS_STATUS_PUSH_COMMITS_BEHIND )) && p+=" "
      # ⇢42 if ahead of the push remote; no leading space if also behind: ⇠42⇢42.
      (( VCS_STATUS_PUSH_COMMITS_AHEAD  )) && p+="${clean}⇢${VCS_STATUS_PUSH_COMMITS_AHEAD}"
      # *42 if have stashes.
      (( VCS_STATUS_STASHES        )) && p+=" ${clean}*${VCS_STATUS_STASHES}"
      # 'merge' if the repo is in an unusual state.
      [[ -n $VCS_STATUS_ACTION     ]] && p+=" ${conflicted}${VCS_STATUS_ACTION}"
      # ~42 if have merge conflicts.
      (( VCS_STATUS_NUM_CONFLICTED )) && p+=" ${conflicted}~${VCS_STATUS_NUM_CONFLICTED}"
      # +42 if have staged changes.
      (( VCS_STATUS_NUM_STAGED     )) && p+=" ${modified}+${VCS_STATUS_NUM_STAGED}"
      # !42 if have unstaged changes.
      (( VCS_STATUS_NUM_UNSTAGED   )) && p+=" ${modified}!${VCS_STATUS_NUM_UNSTAGED}"
      # ?42 if have untracked files. It's really a question mark, your font isn't broken.
      (( VCS_STATUS_NUM_UNTRACKED  )) && p+=" ${untracked}?${VCS_STATUS_NUM_UNTRACKED}"
      GITSTATUS_PROMPT="${p}%f"
}
gitstatus_stop 'MY' && gitstatus_start -s -1 -u -1 -c -1 -d -1 'MY'
autoload -Uz add-zsh-hook
add-zsh-hook precmd my_git_prompt

RPROMPT_BASE="%F{white}%(5~.%-3~··%1~.%~)%f"
RPROMPT_BASE+='${GITSTATUS_PROMPT:+ $GITSTATUS_PROMPT}'

export PS1="%B%(1j.$(printf "\U223F").)%(?..%F{red}$(printf "\U2203")%?%f)%F{yellow}$(printf "\U276f") %b%f"
export RPROMPT=$RPROMPT_BASE
export SPROMPT="zsh: correct %F{red}'%R'%f to %F{red}'%r'%f [%B%Uy%u%bes, %B%Un%u%bo, %B%Ue%u%bdit, %B%Ua%u%bbort]? "


typeset -F SECONDS
function -record-start-time() {
  emulate -L zsh
  ZSH_START_TIME=${ZSH_START_TIME:-$SECONDS}
}
add-zsh-hook preexec -record-start-time

function -report-start-time() {
  emulate -L zsh
  if [ $ZSH_START_TIME ]; then
    local DELTA=$(($SECONDS - $ZSH_START_TIME))
    local DAYS=$((~~($DELTA / 86400)))
    local HOURS=$((~~(($DELTA - $DAYS * 86400) / 3600)))
    local MINUTES=$((~~(($DELTA - $DAYS * 86400 - $HOURS * 3600) / 60)))
    local SECS=$(($DELTA - $DAYS * 86400 - $HOURS * 3600 - $MINUTES * 60))
    local ELAPSED=''
    test "$DAYS" != '0' && ELAPSED="${DAYS}d"
    test "$HOURS" != '0' && ELAPSED="${ELAPSED}${HOURS}h"
    test "$MINUTES" != '0' && ELAPSED="${ELAPSED}${MINUTES}m"
    if [ "$ELAPSED" = '' ]; then
      SECS="$(print -f "%.2f" $SECS)s"
    elif [ "$DAYS" != '0' ]; then
      SECS=''
    else
      SECS="$((~~$SECS))s"
    fi
    ELAPSED="${ELAPSED}${SECS}"
    export RPROMPT="%F{cyan} ${ELAPSED}%f $RPROMPT_BASE"
    unset ZSH_START_TIME
  else
    export RPROMPT="$RPROMPT_BASE"
  fi
}
add-zsh-hook precmd -report-start-time

