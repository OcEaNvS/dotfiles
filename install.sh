#!/bin/bash

# Swap capslock and escape
dconf write /org/gnome/desktop/input-sources/xkb-options "['caps:swapescape']"

# Remove sleeping
gsettings set org.gnome.desktop.session idle-delay 0

# Install zgenom -- A Zsh Plugin Manager
git clone https://github.com/jandamm/zgenom.git "${HOME}/.zgenom"

# Install VimPlug -- A Vim Plugin Manager
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

# Copy ZSH configs
ln -sf ${PWD}/zsh/.zshrc ${HOME}/.zshrc
ln -sf ${PWD}/zsh/.p10k.zsh ${HOME}/.p10k.zsh

# Copy Vim configs
mkdir ${HOME}/.config
mkdir ${HOME}/.config/nvim
ln -sf ${PWD}/nvim/init.vim ${HOME}/.config/nvim/init.vim
mkdir ${HOME}/.config/nvim/plugged

# Install Volta to manage the Node version
sh -c 'curl https://get.volta.sh | bash'

# Install my preferred fonts - PragmataPro
mkdir ${HOME}/.local/share/fonts
cp ${PWD}/fonts/*.ttf ${HOME}/.local/share/fonts
fc-cache -f

# Move binaries from the bin folder into ~/.local/bin
mkdir ${HOME}/.local/bin
cp -f ./bin/* ${HOME}/.local/bin/
