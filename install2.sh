#!/usr/bin/zsh

# Install Node
volta install node

# Install Doom Emacs
unlink ~/.emacs
unlink ~/.emacs.d
unlink ~/.doom.d
ln -s ${PWD}/emacs/.doom.d ${HOME}/.doom.d
sh -c 'git clone --depth 1 https://github.com/hlissner/doom-emacs ~/.emacs.d'
sh -c '~/.emacs.d/bin/doom install'

