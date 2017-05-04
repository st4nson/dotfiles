#!/bin/bash

cp .vimrc ~/.vimrc
cp .tmux.conf ~/.tmux.conf

# Vim
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
vim +PluginInstall +qall 2> /dev/null

# Tmux
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
