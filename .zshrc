export ZSH=$HOME/.oh-my-zsh
ZSH_THEME="af-magic"

# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git z python tmux sudo colorize)
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
if [[ -f ~/.zsh/envars ]]
then
	. ~/.zsh/envars
fi

# Load functions
if [[ -f ~/.zsh/funcs ]]
then
	. ~/.zsh/funcs
fi


if [[ $OSTYPE == "darwin"* ]]; then
	source /usr/local/share/zsh-autosuggestions/zsh-autosuggestions.zsh
	source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
elif [[ $OSTYPE == "linux-gnu"* ]]; then 
	:
fi
