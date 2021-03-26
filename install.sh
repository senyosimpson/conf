# Install common software
sudo apt update
sudo apt -y install git zsh jq curl tmux xclip
sudo snap install --classic code
sudo snap install spotify

# Install neovim
sudo add-apt-repository ppa:neovim-ppa/stable
sudo apt update
sudo apt -y install neovim

# Install Postgresql 
sudo apt -y install postgresql

# Packages needed for choosing terminal themes
sudo apt -y install dconf-cli uuid-runtime

# Install Node
# Remember to update the node version periodically
curl -sL https://deb.nodesource.com/setup_14.x | sudo -E bash -
sudo apt -y install nodejs

# Install Babashka
curl -L -o bbinstall https://raw.githubusercontent.com/babashka/babashka/master/install
chmod +x bbinstall
sudo ./bbinstall
rm bbinstall

# Install docker
sudo apt remove docker docker-engine docker.io containerd runc
sudo apt -y install \
    apt-transport-https \
    ca-certificates \
    gnupg-agent \
    software-properties-common
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo apt-key fingerprint 0EBFCD88
sudo add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"
sudo apt update
sudo apt -y install docker-ce docker-ce-cli containerd.io

# Install Python build dependencies and Pyenv
sudo apt -y install --no-install-recommends \
    make build-essential libssl-dev zlib1g-dev \
    libbz2-dev libreadline-dev libsqlite3-dev \
    wget curl llvm libncurses5-dev xz-utils \
    tk-dev libxml2-dev libxmlsec1-dev libffi-dev liblzma-dev
git clone https://github.com/pyenv/pyenv.git ~/.pyenv
git clone https://github.com/pyenv/pyenv-virtualenv.git ~/.pyenv/plugins/pyenv-virtualenv


# Install Oh My Zsh
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Install Oh My Zsh Plugins
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-completions ${ZSH_CUSTOM:=~/.oh-my-zsh/custom}/plugins/zsh-completions


# Install Rust
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

# Install Vim Plug
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

# Change default shell to zsh
chsh -s /usr/bin/zsh

# Create a .envs file for Python environments
if [ ! -d ~/.envs ]
then
    mkdir ~/.envs
fi

# Links all the dotfiles to the relevant locations in the filesystem
# so that updates can be made just to the dotfiles.

# ln command explanation
# ----------------------
# -s creates a symbolic link
# -f if the target file exists, will unlink so can create the link
# -n if the target is a symbolic link, don't follow it
# -v verbose

if [ ! -d ~/.config/nvim ]
then
    mkdir -p ~/.config/nvim
fi

ln -sfnv ~/dotfiles/coc-settings.json ~/.config/nvim/coc-settings.json
ln -sfnv ~/dotfiles/init.vim ~/.config/nvim/init.vim
ln -sfnv ~/dotfiles/.vimrc ~/.vimrc
ln -sfnv ~/dotfiles/.zshrc ~/.zshrc

if [ ! -d ~/.zsh ]
then
    mkdir ~/.zsh
fi

if [ ! -f ~/.zsh/envars ]
then
    touch ~/.zsh/envars
fi

ln -sfnv ~/dotfiles/.zsh/aliases ~/.zsh/aliases
ln -sfnv ~/dotfiles/.zsh/funcs ~/.zsh/funcs
