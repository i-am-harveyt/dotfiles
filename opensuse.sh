sudo zypper install \
	wezterm \
	fcitx5 fcitx5-rime fcitx5-configtool \
	adobe-sourcehansans-cn-fonts adobe-sourcehansans-tw-fonts \
	adobe-sourcehanserif-cn-fonts adobe-sourcehanserif-tw-fonts \
	seatd seatd-devel \
	brave-browser \
	hyprland hyprland-devel \
	hyprland-qtutils \
	gcc \
	git-core \
	eza \
	stow \
	zsh fish

# get nerd fonts
curl -fsSL https://raw.githubusercontent.com/getnf/getnf/main/install.sh | bash
getnf -i ComicShannsMono
fc-cache
