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

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi


alias v="nvim"
alias gitlabC="ssh -D 8123 -f -C -q -N oyy1@oyy1.host.cs.st-andrews.ac.uk"
alias la="exa -la --git --header"
alias ll="exa -l --git --header"
alias emacs="unlink .emacs; emacs &"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

export VOLTA_HOME="$HOME/.volta"
export PATH="$VOLTA_HOME/bin:$PATH"

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/cs/home/oyy1/miniconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/cs/home/oyy1/miniconda3/etc/profile.d/conda.sh" ]; then
        . "/cs/home/oyy1/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="/cs/home/oyy1/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<


eval $(thefuck --alias)
