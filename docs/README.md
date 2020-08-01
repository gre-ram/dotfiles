## Installation
Make sure to install [Homebrew](https://brew.sh) and clone this Repo with `git clone --recursive`
1. Install via Brewfile in misc `brew bundle`
2. Use [GNU Stow](https://www.gnu.org/software/stow/) with `stow *`

## Dependencies
### Python
- Global:
 - `pandocfilters`
- Default Dev (optional):
 - `pipenv install --dev 'python-language-server[all]'
- In pyenv-virtualenv with name "Neovim":
  - `pynvim`

## Update
Update Plugins via `git submodule update --recursive`
