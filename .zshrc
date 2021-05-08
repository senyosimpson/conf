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
if [[ -f ~/.aliases ]]
then
	. ~/.aliases
fi

# Load environment variables
if [[ -f ~/.env ]]
then
	. ~/.env
fi

# Load functions
if [[ -f ~/.functions ]]
then
	. ~/.functions
fi

autoload -Uz compinit
compinit

# Pyenv
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PATH:$PYENV_ROOT/bin"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"

# fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export FZF_DEFAULT_COMMAND="rg --files --hidden --glob '!.git'"
