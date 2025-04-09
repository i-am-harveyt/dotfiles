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
	neovim \
	luarocks \
	ripgrep \
	fnm \
	tmux \
	rustup \
	zigup \
	go

# Install GUI apps
brew install --casks \
	brave-browser \
	discord \
	font-comic-shanns-mono-nerd-font \
	podman-desktop \
	raycast \
	wezterm \
	zed

# again, get every apps works
exec $SHELL
