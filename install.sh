# TODO: Check which OS type you are working with

# Install common software
sudo apt update
sudo apt -y install zsh neovim jq curl tmux xclip
sudo snap install --classic code
sudo snap install spotify

# Install docker
sudo apt remove docker docker-engine docker.io containerd runc
sudo apt install \
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
sudo apt install docker-ce docker-ce-cli containerd.io

# Install Oh My Zsh
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Install Rust
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
source $HOME/.cargo/env

# Install Vim Plug
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

# Change default shell to zsh
chsh -s /usr/bin/zsh

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

ln -sfnv ~/dotfiles/init.vim ~/.config/nvim/init.vim
ln -sfnv ~/dotfiles/.vimrc ~/.vimrc
ln -sfnv ~/dotfiles/.zshrc ~/.zshrc

if [ ! -d ~/.zsh ]
then
    mkdir ~/.zsh
fi

ln -sfnv ~/dotfiles/.zsh/aliases ~/.zsh/aliases
ln -sfnv ~/dotfiles/.zsh/funcs ~/.zsh/funcs
