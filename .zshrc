# If you come from bash you might have to change your $PATH.
export PATH=$HOME/bin:/usr/local/bin:$PATH

#Python $PATH
export PATH=/usr/local/opt/python/libexec/bin:$PATH


# Start-Up Procedure
ln -s $HOME/.snippets/* $HOME/.vim/snippets/
ln -s $HOME/.dracula/zsh/dracula.zsh-theme $HOME/.oh-my-zsh/themes/dracula.zsh-theme
clear

# Path to your oh-my-zsh installation.
export ZSH="/Users/gregor/.oh-my-zsh"

#Theme
ZSH_THEME="dracula"

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
)

ZSH_TMUX_AUTOSTART=true

source $ZSH/oh-my-zsh.sh


alias ynab="Rscript ~/code/dkb-ynab/myaccounts.R"
alias getbib="~/.scripts/getbib.zsh"
alias addbib="~/.scripts/addbib.sh"
