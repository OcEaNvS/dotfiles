if [ -d "$HOME/.bin" ] ;
  then PATH="$HOME/.bin:$PATH"
fi

if [ -d "$HOME/.local/bin" ] ;
  then PATH="$HOME/.local/bin:$PATH"
fi

source "${HOME}/.zgenom/zgenom.zsh"
export PATH=$PATH:$HOME/.local/bin
zgenom autoupdate

if ! zgenom saved; then
	#Ohmyzsh Base Library
	zgenom ohmyzsh

	#OhMyZsh Plugins
	zgenom ohmyzsh plugins/git
	zgenom ohmyzsh plugins/command-not-found
	zgenom ohmyzsh plugins/thefuck
	zgenom ohmyzsh plugins/tmux

	#Plugins from Git	
	zgenom load zsh-users/zsh-autosuggestions
	zgenom load zdharma-continuum/fast-syntax-highlighting

	#Theme
	zgenom load romkatv/powerlevel10k powerlevel10k

	#Saving
	zgenom save

	#Compile zsh files
	zgenom compile "${HOME}/.zshrc"

fi

autoload -U promptinit; promptinit
autoload -U colors && colors
export BAT_THEME="Dracula"

# Load Version control information
autoload -Uz vcs_info
precmd() { vcs_info }

# Format the vcs_info_msg_0_ variable
zstyle ':vcs_info:git:*' formats "%b"

ZSH_THEME_GIT_PROMPT_PREFIX=""
ZSH_THEME_GIT_PROMPT_SUFFIX=""
ZSH_THEME_GIT_PROMPT_DIRTY=" ✘"
ZSH_THEME_GIT_PROMPT_CLEAN=" ✔"
ZSH_THEME_GIT_PROMPT_ADDED=" ✚"
ZSH_THEME_GIT_PROMPT_MODIFIED=" ✹"
ZSH_THEME_GIT_PROMPT_DELETED=" ✖"
ZSH_THEME_GIT_PROMPT_RENAMED=" ➜"
ZSH_THEME_GIT_PROMPT_UNMERGED=" ═"
ZSH_THEME_GIT_PROMPT_UNTRACKED=" ✭"

setopt prompt_subst
PROMPT="%F{011}%~ %F{060}%n@%m%F{010}"$'\n'" ❯ %f"
RPROMPT='%F{060}${vcs_info_msg_0_}`git_prompt_status`'

HISTSIZE=50000
SAVEHIST=50000
HISTFILE=~/.zsh_history
HIST_STAMPS="dd/mm/yyyy"
compinit
_comp_options+=(globdots) # lets you tab complete hidden files by default

[[ -f ~/.zshrc-personal ]] && . ~/.zshrc-personal


ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=60'
colorscript -r

eval $(thefuck --alias)
export VOLTA_HOME="$HOME/.volta"
export PATH="$VOLTA_HOME/bin:$PATH"
