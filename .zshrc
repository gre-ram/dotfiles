# If you come from bash you might have to change your $PATH.
export PATH=$HOME/bin:/usr/local/bin:$PATH

#Python $PATH
export PATH=/usr/local/opt/python/libexec/bin:$PATH


#using gnu sed instead of mac default
PATH="/usr/local/opt/gnu-sed/libexec/gnubin:$PATH"
# Start-Up Procedure
ln -s $HOME/.snippets/* $HOME/.vim/snippets/
ln -s $HOME/.custom/modules/powerlevel10k $HOME/.custom/zsh/themes/powerlevel10k
ln -s $HOME/.custom/modules/zsh-syntax-highlighting $HOME/.custom/zsh/plugins/
clear

# Path to your oh-my-zsh installation.
export ZSH="/Users/gregor/.oh-my-zsh"

ZSH_CUSTOM=$HOME/.custom/zsh
#Theme
ZSH_THEME="powerlevel10k/powerlevel10k"

#auto-update.
export UPDATE_ZSH_DAYS=1

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS=true

#auto-correction.
ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
HIST_STAMPS="yyyy-mm-dd"

# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(
git
tmux
vi-mode
github
zsh-syntax-highlighting
)

ZSH_TMUX_AUTOSTART=true

source $ZSH/oh-my-zsh.sh


alias ynab="Rscript ~/code/dkb-ynab/myaccounts.R"
alias getbib="~/.scripts/getbib.zsh"
alias addbib="~/.scripts/addbib.sh"
alias sepbib="~/.scripts/sepbib.sh"
alias notate="~/.scripts/notate.zsh" 
alias getnotes="~/.scripts/getnotes.zsh"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
