#!/usr/bin/env bash

ln -si "$(pwd)"/.zshrc ~/.zshrc
ln -si "$(pwd)"/.zsh_functions ~/.zsh_functions
ln -si "$(pwd)"/.vimrc ~/.vimrc
ln -si "$(pwd)"/.tmux.conf ~/.tmux.conf

# Install oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

# Vim-Plug
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# Tmux
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
