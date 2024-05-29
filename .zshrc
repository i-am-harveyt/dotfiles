########## PATH ##########
# # default path
export PATH=$PATH:/usr/local/bin
export PATH=$PATH:/usr/bin
export PATH=$PATH:/bin
export PATH=$PATH:/usr/sbin
export PATH=$PATH:/sbin

# homebrew
export PATH=$PATH:/opt/homebrew/bin
export PATH=$PATH:~/.local/bin:/usr/bin
export PATH=$PATH:/opt/homebrew/

# Golang setup
export GOPATH=~/work/go
export PATH=$PATH:$GOPATH/bin
export PATH=$PATH:~/go/
export PATH=$PATH:/usr/local/Golang/bin

# For JSP setup
export JAVA_HOME=/Library/Java/JavaVirtualMachines/temurin-11.jdk/Contents/Home
export PATH=$PATH:$JAVA_HOME/bin
export CLASSPATH=$CLASSPATH:/Library/Tomcat_10/lib/servlet-api.jar
export CLASSPATH=$JAVA_HOME/lib/tools.jar:$JAVA_HOME/lib/dt.jar

# For llvm setup
export PATH=$PATH:/opt/homebrew/opt/llvm/bin

# evoke pdflatex
export PATH=$PATH:/Library/TeX/texbin

# evoke python3.9 path
export PATH=$PATH:/Library/Frameworks/Python.framework/Versions/3.9/bin

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

# for java setup
export PATH="/opt/homebrew/opt/openjdk/bin:$PATH"

# for wezterm
export PATH="$PATH:/Applications/WezTerm.app/Contents/MacOS"

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

# # version control
# autoload -Uz vcs_info
# precmd() { vcs_info }
# setopt PROMPT_SUBST
#
# # customize Prompt
# PROMPT='[%F{blue}%n%F{yellow}:%3~%F{white}]
# %F{white}%# '
# RPROMPT="%F{red}${vcs_info_msg_0_} %F{cyan}[%*]"

########## plugins ##########
eval "$(starship init zsh)"
source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh


########## Alias ##########
# Establishing custom commands below
alias nv="nvim"
alias vs="open -a Visual\ Studio\ Code.app"
alias md="open -a MarkText.app"
alias ls="exa"
alias la="exa -a"
alias ll="exa -l"
alias lla="exa -la"
alias calendar="open https://calendar.google.com/"
alias lazy="NVIM_APPNAME=LazyVim nvim"
alias line="open -a Line"
alias brave="open -a Brave\ Browser"
alias arc="open -a Arc"
alias mail="open -a Thunderbird"
alias obs="open -a Obsidian.app"

########## Run on open ##########
run_on_open() {
	neofetch
}
# run_on_open

# export PATH="/Users/tonghaoting/.detaspace/bin:$PATH"

# pnpm
export PNPM_HOME="/Users/tonghaoting/Library/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end

# bun completions
[ -s "/Users/tonghaoting/.bun/_bun" ] && source "/Users/tonghaoting/.bun/_bun"
