export ZSH=$HOME/.oh-my-zsh
ZSH_THEME="afowler"
ZSH_DISABLE_COMPFIX=true

plugins=(
    z
    git
    sudo
    tmux
    python
    colorize
    zsh-autosuggestions
    zsh-syntax-highlighting
    zsh-completions
)
source $ZSH/oh-my-zsh.sh


# Locale
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8

# Load aliases
if [[ -f ~/.zsh/aliases ]]
then
	. ~/.zsh/aliases
fi

# Load environment variables
if [[ -f ~/.zsh/env ]]
then
	. ~/.zsh/env
fi

# Load functions
if [[ -f ~/.zsh/functions ]]
then
	. ~/.zsh/functions
fi

autoload -Uz compinit
compinit

# Pyenv
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"
