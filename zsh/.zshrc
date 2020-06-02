# If you come from bash you might have to change your $PATH.
#export PATH=$HOME/bin:/usr/local/bin:$PATH

################################
###########  Basic  ############
################################
export LANG="en_US.UTF-8"
export EDITOR="nvim"
PATH="/usr/local/opt/gnu-sed/libexec/gnubin:$PATH"
export PATH
source ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
autoload -U colors && colors
export CLICOLOR=1
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"

setopt AUTO_CD                 # [default] .. is shortcut for cd .. (etc)
setopt AUTO_PARAM_SLASH        # tab completing directory appends a slash
setopt AUTO_PUSHD              # [default] cd automatically pushes old dir onto dir stack
setopt AUTO_RESUME             # allow simple commands to resume backgrounded jobs
setopt CORRECT                 # [default] command auto-correction
setopt CORRECT_ALL             # [default] argument auto-correction
setopt NO_FLOW_CONTROL         # disable start (C-s) and stop (C-q) characters
setopt NO_HIST_IGNORE_ALL_DUPS # don't filter non-contiguous duplicates from history
setopt HIST_FIND_NO_DUPS       # don't show dupes when searching
setopt HIST_IGNORE_DUPS        # do filter contiguous duplicates from history
setopt HIST_IGNORE_SPACE       # [default] don't record commands starting with a space
setopt HIST_VERIFY             # confirm history expansion (!$, !!, !foo)
setopt INTERACTIVE_COMMENTS    # [default] allow comments, even in interactive shells
setopt LIST_PACKED             # make completion lists more densely packed
setopt MENU_COMPLETE           # auto-insert first possible ambiguous completion
setopt NO_NOMATCH              # [default] unmatched patterns are left unchanged
setopt PRINT_EXIT_VALUE        # [default] for non-zero exit status
setopt PUSHD_IGNORE_DUPS       # don't push multiple copies of same dir onto stack
setopt PUSHD_SILENT            # [default] don't print dir stack after pushing/popping
setopt SHARE_HISTORY           # share history across shells
setopt PROMPT_SUBST            # Allow for functions in the prompt.
setopt NO_CASE_GLOB            # Case Insensitive Globbing

################################
############ Aliases ###########
################################

alias g2cp="cd ~/Documents/Sci-Bib/Projekte/Politische_Frauen && open . && l"
alias g2methoden="cd ~/Documents/Sci-Bib/Methoden && l"
alias g2sci-bib="cd ~/Documents/Sci-Bib && l"
alias g2code="cd ~/Code && l"
alias g2drafts="cd ~/Documents/Drafts && l"
alias g2vimrc="vim ~/dotfiles/Neovim/.config/nvim/init.vim"
alias g2tmuxconf="vim ~/dotfiles/tmux/.tmux.conf"
alias g2zshrc="vim ~/dotfiles/zsh/.zshrc"

alias internet="/System/Library/PrivateFrameworks/Apple80211.framework/Versions/Current/Resources/airport -I"

alias ynab="Rscript ~/code/dkb-ynab/myaccounts.R"
alias getbib="~/.scripts/getbib.zsh"
alias addbib="~/.scripts/addbib.sh"
alias sepbib="~/.scripts/sepbib.sh"
alias notate="~/.scripts/notate.zsh" 
alias getnotes="~/.scripts/getnotes.zsh"

alias g='git'
alias ga='git add'
alias gaa='git add --all'
alias gc='git commit -v'
alias gcl='git clone --recurse-submodules'
alias gd='git diff'
alias gss='git status -s'
alias gst='git status'

alias vi='nvim'
alias vim='nvim'
alias tmux-start='session=$(tmux ls | fzf | pcregrep -o "^\w+") && tmux -u attach -t $session || tmux -u new-session -A -s main'

ls -G . &>/dev/null && alias ls='ls -G'
alias lsa='ls -lah'
alias l='ls -lah'
alias ll='ls -lh'
alias la='ls -lAh'
alias -g ...='../..'
alias -g ....='../../..'
alias -g .....='../../../..'
alias -g ......='../../../../..'

################################
########### vi-mode ############
################################
bindkey -v
autoload -Uz edit-command-line
zle -N edit-command-line
bindkey -M vicmd 'v' edit-command-line


################################
########## Completion ##########
################################
autoload -Uz compinit && compinit
autoload bashcompinit && bashcompinit
zstyle ':completion:*' list-suffixes
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
source ~/.zsh/powerlevel10k/powerlevel10k.zsh-theme
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
