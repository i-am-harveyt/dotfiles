########## PATH ##########
# Neovim Mason Setup
export PATH=$PATH:$HOME/.local/share/nvim/mason/bin

# for yazi
function yy() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")"
	yazi "$@" --cwd-file="$tmp"
	if cwd="$(cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
		cd -- "$cwd"
	fi
	rm -f -- "$tmp"
}

# for fzf
source <(fzf --zsh)
export FZF_DEFAULT_COMMAND="fd --hidden --strip-cwd-prefix --exclude .git"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_ALT_C_COMMAND="fd --type=d --hidden --strip-cwd-prefix --exclude .git"

########## BASIC CONFIG ##########
# History
HISTSIZE=10000
SAVEHIST=10000
HISTFILE=$HOME/.zsh_history

# editor
export EDITOR=nvim

autoload -U compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit
_comp_options+=(globdots)

# vi keybinding
bindkey -v
export KEYTIMEOUT=1

# alias
source $HOME/.zsh_alias
source $HOME/.zsh_functions

########## plugins ##########
eval "$(starship init zsh)"

eval "$(mise activate zsh)"

export INPUT_METHOD=fcitx
export GTK_IM_MODULE=fcitx
export QT_IM_MODULE=fcitx
export XMODIFIERS=@im=fcitx
