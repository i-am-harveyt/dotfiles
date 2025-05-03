# get alias
source ~/.zsh_alias

# theme
fish_config theme choose "Rosé Pine"

# vim keybindings
function fish_hybrid_key_bindings --description \
	"Vi-style bindings that inherit emacs-style bindings in all modes"
    for mode in default insert visual
        fish_default_key_bindings -M $mode
    end
    fish_vi_key_bindings --no-erase
end
set -g fish_key_bindings fish_hybrid_key_bindings

# fzf
fzf --fish | source

# yazi
# function yy
# 	set tmp (mktemp -t "yazi-cwd.XXXXXX")
# 	yazi $argv --cwd-file="$tmp"
# 	if set cwd (command cat -- "$tmp"); and [ -n "$cwd" ]; and [ "$cwd" != "$PWD" ]
# 		builtin cd -- "$cwd"
# 	end
# 	rm -f -- "$tmp"
# end

if status is-interactive
    # Commands to run in interactive sessions can go here
end

# starship
starship init fish | source


function fish_greeting
end
