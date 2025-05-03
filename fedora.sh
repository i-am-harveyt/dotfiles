sudo dnf install \
	stow \
	polybar \
	rofi \
	fcitx5 \
	fcitx5-configtool \
	fcitx5-gtk \
	fcitx5-qt \
	fcitx5-chewing \
	neovim \
	git \
	brightnessctl


# zigup
curl -L https://github.com/marler8997/zigup/releases/latest/download/zigup-x86_64-linux.tar.gz | tar xz

# rustup
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

# fnm
curl -fsSL https://fnm.vercel.app/install | bash
