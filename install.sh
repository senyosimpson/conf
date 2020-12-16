# Links all the dotfiles to the relevant locations in the filesystem
# so that updates can be made just to the dotfiles.

# ln command explanation
# ----------------------
# -s creates a symbolic link
# -f if the target file exists, will unlink so can create the link
# -n if the target is a symbolic link, don't follow it
# -v verbose

ln -sfnv ~/dotfiles/init.vim ~/.config/nvim/init.vim
ln -sfnv ~/dotfiles/.vimrc ~/.vimrc
ln -sfnv ~/dotfiles/.zshrc ~/.zshrc

if [ ! -d ~/.zsh ]
then
    mkdir ~/.zsh
fi

ln -sfnv ~/dotfiles/.zsh/aliases ~/.zsh/aliases
ln -sfnv ~/dotfiles/.zsh/funcs ~/.zsh/funcs
