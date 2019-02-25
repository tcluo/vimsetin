#!/bin/bash

HOME_VIMRC=$HOME/.vimrc
HOME_VIM_DIR=$HOME/.vim

# Backup the original configurations
if [ -f "$HOME_VIMRC" ]; then
  mv "$HOME_VIMRC" "$HOME_VIMRC.bak"
fi

if [ -d "$HOME_VIM_DIR" ]; then
  mv "$HOME_VIM_DIR" "$HOME_VIM_DIR.bak"
fi

# Install
ln -s "$PWD/vimrc" "$HOME_VIMRC"
ln -s "$PWD" "$HOME_VIM_DIR"

source "$HOME_VIMRC"
