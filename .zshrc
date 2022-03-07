export ZSH=$HOME/.oh-my-zsh
ZSH_THEME="afowler"
ZSH_DISABLE_COMPFIX=true

plugins=(
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


# locale
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8

# load aliases
if [[ -f ~/.aliases ]]
then
	. ~/.aliases
fi

# load environment variables
if [[ -f ~/.env ]]
then
	. ~/.env
fi

# load functions
if [[ -f ~/.functions ]]
then
	. ~/.functions
fi

autoload -Uz compinit
compinit

# node version manager
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# dog (a modern dig)
# [ -s "$HOME/.dog/completions/dog.zsh" ] && \. "$HOME/.dog/completions/dog.zsh"  # This loads nvm bash_completion

# pyenv
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PATH:$PYENV_ROOT/bin"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"

# fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export FZF_DEFAULT_COMMAND="rg --files --hidden --glob '!.git'"

# atuin
eval "$(atuin init zsh)"

# direnv
eval "$(direnv hook zsh)"

# postgres
export PATH="$PATH:/usr/lib/postgresql/13/bin/"

# zoxide
eval "$(zoxide init zsh)"

# go
export GOPATH="$HOME/.go"
export PATH="$PATH:/usr/local/go/bin:$GOPATH/bin"

# fly.io
export FLYCTL_INSTALL="/home/senyeezus/.fly"
export PATH="$PATH:$FLYCTL_INSTALL/bin"
