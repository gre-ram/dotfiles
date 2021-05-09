export LANG="en_US.UTF-8"
export EDITOR="nvim"
export PYENV_ROOT="$HOME/.pyenv"
local pathstring="$HOME/.scripts:"
local pathstring="/usr/local/sbin:$pathstring"
local pathstring="/usr/local/opt/coreutils/libexec/gnubin:$pathstring"
local pathstring="$PYENV_ROOT/bin:$pathstring"
local pathstring="/Library/Apple/usr/bin:$pathstring"
local pathstring="/Library/TeX/texbin:$pathstring"
local pathstring="/sbin:$pathstring"
local pathstring="/usr/sbin:$pathstring"
local pathstring="/bin:$pathstring"
local pathstring="/usr/bin:$pathstring"
local pathstring="/usr/local/bin:$pathstring"
export PATH="$pathstring"
export PIPENV_VENV_IN_PROJECT=1
export PIPENV_PYTHON="$PYENV_ROOT/shims/python"

eval "$(pyenv init --path)"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"


