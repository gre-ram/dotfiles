# If you come from bash you might have to change your $PATH.
#export PATH=$HOME/bin:/usr/local/bin:$PATH

#Python $PATH
export PATH=/usr/local/opt/python/libexec/bin:$PATH

#using gnu sed instead of mac default
PATH="/usr/local/opt/gnu-sed/libexec/gnubin:$PATH"
path=('$HOME/.snippets' $path)
export PATH
source ~/.zplug/init.zsh
zplug "zsh-users/zsh-completions"
zplug "zsh-users/zsh-syntax-highlighting", from:github, defer:3 
zplug "romkatv/powerlevel10k", as:theme, depth:1
zplug "lib/directories", from:oh-my-zsh
zplug "lib/completion", from:oh-my-zsh
zplug "lib/termsupport", from:oh-my-zsh
zplug "lib/clipboard", from:oh-my-zsh, if:"[[ $OSTYPE == *darwin* ]]"
zplug "lib/theme-and-appearance", from:oh-my-zsh, if:"[[ $OSTYPE == *darwin* ]]"

# Install plugins if there are plugins that have not been installed
if ! zplug check --verbose; then
    printf "Install? [y/N]: "
    if read -q; then
        echo; zplug install
    fi
fi
# Then, source plugins and add commands to $PATH
zplug load 


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
alias tmux-start='tmux new-session -A -s main'

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

