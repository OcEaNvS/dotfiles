#!/bin/bash
CSHOME="/cs/home/oyy1"

# Swap capslock and escape
dconf write /org/gnome/desktop/input-sources/xkb-options "['caps:swapescape']"

# Remove sleeping
gsettings set org.gnome.desktop.session idle-delay 0

# Install zgenom -- A Zsh Plugin Manager
if [ ! -d "${HOME}/.zgenom" ]
	then
		git clone https://github.com/jandamm/zgenom.git "${HOME}/.zgenom"
fi

# Install VimPlug -- A Vim Plugin Manager
if [ ! -f "${HOME}/.local/share/nvim/site/autoload/plug.vim" ]
	then
		sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
			https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
fi

# Link ZSH configs
if [ ! -L "${HOME}/.zshrc" ]
	then
		ln -sf ${HOME}/Documents/scripts/zsh/.zshrc ${HOME}/.zshrc
fi

if [ ! -L "${HOME}/.p10k.zsh" ]
	then
		ln -sf ${HOME}/Documents/scripts/zsh/.p10k.zsh ${HOME}/.p10k.zsh
fi

# Link Vim configs
if [ ! -L "${HOME}/.config/nvim/init.vim" ]
	then
		mkdir ${HOME}/.config
		mkdir ${HOME}/.config/nvim
		ln -sf ${HOME}/Documents/scripts/nvim/init.vim ${HOME}/.config/nvim/init.vim
		mkdir ${HOME}/.config/nvim/plugged
fi

# Install Volta to manage the Node version
if [ ! -d "${HOME}/.volta" ]
	then
		sh -c 'curl https://get.volta.sh | bash'
		${HOME}/.volta/bin/volta install node
fi

# Install my preferred fonts - PragmataPro
if [ ! -d "${HOME}/.local/share/fonts" ]
	then
		mkdir ${HOME}/.local/share/fonts
		cp ${HOME}/Documents/scripts/fonts/*.ttf ${HOME}/.local/share/fonts
		fc-cache -f
fi

# Move binaries from the bin folder into ~/.local/bin
if [ ! -d "${HOME}/.local/bin" ]
	then
		mkdir ${HOME}/.local/bin
		cp -f ${HOME}/Documents/scripts/bin/* ${HOME}/.local/bin/
fi

# Remove .mozilla and replace it with the CSHOME
if [ ! -L "${HOME}/.mozilla" ]
	then
		rm -rf ${HOME}/.mozilla
		ln -sf ${CSHOME}/.mozilla ${HOME}
fi

# Add Rustup Toolchain
if [ ! -L "${HOME}/.rustup" ]
	then
		ln -sf ${CSHOME}/.rustup ${HOME}
		ln -sf ${CSHOME}/.cargo  ${HOME}
fi
