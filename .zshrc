########## PATH ##########
# homebrew
export PATH=$PATH:/opt/homebrew/bin:$HOME/.local/bin:/usr/bin:/opt/homebrew/

# Golang setup
export GOPATH=$HOME/work/go
export PATH=$PATH:$GOPATH/bin:$HOME/go/:/usr/local/Golang/bin

# Ocaml setup
eval $(opam env)

# Neovim VC (bob) setup
export PATH=$PATH:$HOME/.local/share/bob/nvim-bin

# Neovim Mason Setup
export PATH=$PATH:$HOME/.local/share/nvim/mason/bin

# For llvm setup
export PATH=$PATH:/opt/homebrew/opt/llvm/bin
export LDFLAGS="-L/opt/homebrew/opt/llvm/lib"
export CPPFLAGS="-I/opt/homebrew/opt/llvm/include"

# pyenv-virtualenv
export PATH="$HOME/.pyenv/bin:$PATH"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"

# set python3 -> python
eval "$(pyenv init --path)"

# for java setup
export PATH="/opt/homebrew/opt/openjdk/bin:$PATH"

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

# completion
if type brew &>/dev/null
then
  FPATH="$(brew --prefix)/share/zsh/site-functions:${FPATH}"

  autoload -Uz compinit
  compinit
fi
autoload -U compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit
_comp_options+=(globdots)

# vi keybinding
bindkey -v
export KEYTIMEOUT=1

# alias
source /Users/tonghaoting/.zsh_alias

########## plugins ##########
eval "$(starship init zsh)"
# source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh
# source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# pnpm
export PNPM_HOME="/$HOME/Library/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end

# bun completions
[ -s "$HOME/.bun/_bun" ] && source "$HOME/.bun/_bun"

# Add deno completions to search path
if [[ ":$FPATH:" != *":$HOME/.zsh/completions:"* ]]; then export FPATH="/$HOME/.zsh/completions:$FPATH"; fi
. "/$HOME/.deno/env"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

# for fnm
eval "$(fnm env --use-on-cd --shell zsh)"

# for zig
export PATH="$HOME/zig/0.14.0/files/:$PATH"

# for rustup
export PATH="/opt/homebrew/opt/rustup/bin:$PATH"
export PATH="$HOME/.cargo/bin/:$PATH"

# exec fish
exec nu
