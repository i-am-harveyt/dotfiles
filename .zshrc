########## PATH ##########
# homebrew
export PATH=$PATH:/opt/homebrew/bin:$HOME/.local/bin:/usr/bin:/opt/homebrew/

# Neovim Mason Setup
export PATH=$PATH:$HOME/.local/share/nvim/mason/bin

# For llvm setup
export PATH=$PATH:/opt/homebrew/opt/llvm/bin
export LDFLAGS="-L/opt/homebrew/opt/llvm/lib"
export CPPFLAGS="-I/opt/homebrew/opt/llvm/include"

# for wezterm
export PATH=$PATH:/Applications/WezTerm.app/Contents/MacOS

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
EDITOR=nvim

# vi keybinding
bindkey -v
export KEYTIMEOUT=1

# alias
source $HOME/.zsh_alias

# functions
source $HOME/.zsh_functions

########## plugins ##########
eval "$(starship init zsh)"

# for mise
eval "$(mise activate zsh)"

# for jpmk
eval "$(~/Programming/Rust/jpmk/target/release/jpmk init zsh)"
export PATH="$PATH:/$HOME/Programming/Rust/jpmk/target/release"

# exec fish

