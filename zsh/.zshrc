#macosx variable for ohmyzsh scripts
OSTYPE="$*darwin*"
# If you come from bash you might have to change your $PATH.
#export PATH=$HOME/bin:/usr/local/bin:$PATH
export LANG="en_US.UTF-8"
export EDITOR="nvim"
PATH="/usr/local/opt/gnu-sed/libexec/gnubin:$PATH"
export PATH

source ~/.zsh/ohmyzsh/clipboard.zsh
source ~/.zsh/ohmyzsh/completion.zsh
source ~/.zsh/ohmyzsh/directories.zsh
source ~/.zsh/ohmyzsh/termsupport.zsh
source ~/.zsh/ohmyzsh/theme-and-appearance.zsh
source ~/.zsh/ohmyzsh/vi-mode.plugin.zsh
source ~/.zsh/powerlevel10k/powerlevel10k.zsh-theme
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
source ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

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

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init -)"
  eval "$(pyenv virtualenv-init -)"
fi
