# install brew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# to get brew work
exec $SHELL

# sync dotfiles with stow
brew install stow
cd dotfiles && stow --adopt .

# install TUI apps
brew install \
	eza \
	fish \
	fzf \
	git-delta \
	htop \
	yazi \
	luarocks \
	ripgrep \
	tmux \
	mise


# add neovim plugin to install nightly version
mise plugins add neovim
mise install

# Install GUI apps
brew install --casks \
	antigravity \
	brave-browser \
	font-comic-shanns-mono-nerd-font \
	podman-desktop \
	raycast \
	wezterm@nightly \
	zed

# again, get every apps works
exec $SHELL
