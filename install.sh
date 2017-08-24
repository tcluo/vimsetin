#!/bin/bash

rm -rf $HOME/.vimrc
rm -rf $HOME/.vim
ln -s $PWD/vimrc $HOME/.vimrc
ln -s $PWD $HOME/.vim

source $HOME/.vimrc
