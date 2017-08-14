#!/bin/bash

# Install oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

ln -s "$(pwd)"/.zshrc ~/.zshrc
ln -s "$(pwd)"/.zsh_functions ~/.zsh_functions
ln -s "$(pwd)"/.vimrc ~/.vimrc
ln -s "$(pwd)"/.tmux.conf ~/.tmux.conf

# Vim
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
vim +PluginInstall +qall 2> /dev/null

# Tmux
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
