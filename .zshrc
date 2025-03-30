########## PATH ##########
# homebrew
export PATH=$PATH:/opt/homebrew/bin
export PATH=$PATH:$HOME/.local/bin:/usr/bin
export PATH=$PATH:/opt/homebrew/

# Golang setup
export GOPATH=$HOME/work/go
export PATH=$PATH:$GOPATH/bin
export PATH=$PATH:$HOME/go/
export PATH=$PATH:/usr/local/Golang/bin

# For llvm setup
export PATH=$PATH:/opt/homebrew/opt/llvm/bin

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

########## Alias ##########
alias nv="nvim"
alias vs="codium"
alias calendar="open https://calendar.google.com/"
alias line="open -a Line"
alias ls="eza"
alias ll="eza -l"
alias la="eza -a"
alias lla="eza -la"
alias lt="eza -T"
alias ghostty_config='nvim /Users/tonghaoting/Library/Application\ Support/com.mitchellh.ghostty/config'

########## plugins ##########
eval "$(starship init zsh)"
source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

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

