########## PATH ##########
# default path
export PATH=$PATH:/usr/local/bin
export PATH=$PATH:/usr/bin
export PATH=$PATH:/bin
export PATH=$PATH:/usr/sbin
export PATH=$PATH:/sbin

# homebrew
export PATH=$PATH:/opt/homebrew/bin
export PATH=$PATH:~/.local/bin:/usr/bin
export PATH=$PATH:/opt/homebrew/

# Golang
export GOPATH=~/work/go
export PATH=$PATH:$GOPATH/bin
export PATH=$PATH:~/go/
export PATH=$PATH:/usr/local/Golang/bin

# llvm
export PATH=$PATH:/opt/homebrew/opt/llvm/bin

# evoke pdflatex
export PATH=$PATH:/Library/TeX/texbin

# pyenv-virtualenv
export PATH="$HOME/.pyenv/bin:$PATH"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"

# set python3 -> python
eval "$(pyenv init --path)"

# for nvm
export NVM_DIR="$HOME/.nvm"
[ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"  # This loads nvm
[ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion

# pnpm
export PNPM_HOME="/Users/tonghaoting/Library/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end

########## BASIC CONFIG ##########
# History
HISTSIZE=10000
SAVEHIST=10000
HISTFILE=~/.zsh_history

# editor
EDITOR=nvim

# completion
autoload -U compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit
_comp_options+=(globdots)

# vi keybinding
bindkey -v
export KEYTIMEOUT=1

########## plugins ##########
eval "$(starship init zsh)"
source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

########## Alias ##########
# Establishing custom commands below
alias vs="open -a Visual\ Studio\ Code.app"
alias ll="exa -l"
alias la="exa -la"
alias lazy="NVIM_APPNAME=LazyVim nvim"
alias arc="open -a Arc"
alias obs="open -a Obsidian.app"
