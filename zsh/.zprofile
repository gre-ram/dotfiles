export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init --path)"


export PIPENV_VENV_IN_PROJECT=1
export PIPENV_PYTHON="$PYENV_ROOT/shims/python"

eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"