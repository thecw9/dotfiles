#/bin/bash
# Description: Install script for Arch Linux
# Author: Jiawen Zuo

source $(dirname $0)/scripts/library.sh
clear
echo "     _       _    __ _ _            "
echo "  __| | ___ | |_ / _(_) | ___  ___  "
echo " / _' |/ _ \| __| |_| | |/ _ \/ __| "
echo "| (_| | (_) | |_|  _| | |  __/\__ \ "
echo " \__,_|\___/ \__|_| |_|_|\___||___/ "
echo "                                    "
echo "by Jiawen Zuo (2023)"
echo "-------------------------------------"
echo ""
echo "The script will ask for permission to remove existing folders and files."
echo "But you can decide to keep your local versions by answering with No (Nn)."
echo "Symbolic links will be created from ~/dotfiles into your home and .config directories."
echo ""

# ------------------------------------------------------
# add archlinuxcn repo
# ------------------------------------------------------
echo ""
echo "-------------------------------------"
echo "$ACTION Adding ArchlinuxCN repo..."
echo "-------------------------------------"
if ! grep -q "\[archlinuxcn\]" /etc/pacman.conf; then
	read -p "$ACTION - Would you like to add ArchlinuxCN repo? [Y/n] " yn
	case $yn in
	[Yy]* | "")
		echo "$NOTE Adding ArchlinuxCN repo..."
		echo "" | sudo tee -a /etc/pacman.conf
		echo "[archlinuxcn]" | sudo tee -a /etc/pacman.conf
		echo 'Server = https://repo.archlinuxcn.org/$arch' | sudo tee -a /etc/pacman.conf
		echo "$OK ArchlinuxCN repo added."
		# import PGP key
		echo "$NOTE Importing PGP key..."
		sudo pacman -Sy && sudo pacman -S archlinuxcn-keyring
		;;
	[Nn]*)
		echo "$WARNING Skipping add ArchlinuxCN repo"
		;;
	esac
else
	echo "$NOTE ArchlinuxCN repo already exists."
fi

# ------------------------------------------------------
# install paru
# ------------------------------------------------------
echo ""
echo "-------------------------------------"
echo "$ACTION Installing paru..."
echo "-------------------------------------"
if command -v paru &>/dev/null; then
	echo ""
	echo "$OK - paru was found."
	echo ""
else
	echo "Installing paru..."
	sudo pacman -S paru
fi

# ------------------------------------------------------
# Install Fonts
# ------------------------------------------------------
echo ""
echo "-------------------------------------"
echo "$ACTION Installing fonts..."
echo "-------------------------------------"
font_pkgs=(
	"ttf-firacode-nerd"
	"ttf-jetbrains-mono-nerd"
	"ttf-roboto-mono"
)
install_packages $font_pkgs

# ------------------------------------------------------
# Install Applications
# ------------------------------------------------------
echo ""
echo "-------------------------------------"
echo "$ACTION Installing applications..."
echo "-------------------------------------"
pkgs=(
	"zsh"
	"sof-firmware"
	"network-manager-applet"
	"v2raya"
	"nemo"
	"neovim"
	"joshuto"
	"google-chrome"
	"wps-office-cn"
	"linuxqq"
	"wechat-uos"
	"feishu-bin"
)
install_packages $pkgs

# check if oh-my-zsh is installed
echo ""
echo "-------------------------------------"
echo "$ACTION Installing oh-my-zsh..."
echo "-------------------------------------"
if [ ! -d ~/.oh-my-zsh ]; then
	sh -c "$(wget https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh -O -)"
fi

# check if zsh-autosuggestions is installed
echo ""
echo "-------------------------------------"
echo "$ACTION Installing zsh-autosuggestions..."
echo "-------------------------------------"
if [ ! -d ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions ]; then
	git clone https://github.com/zsh-users/zsh-autosuggestions ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions
fi

# ------------------------------------------------------
# Create symbolic links
# ------------------------------------------------------
# name symlink source target
echo ""
echo "-------------------------------------"
echo "$ACTION Creating symbolic links..."
echo "-------------------------------------"
create_symlink ./config/.Xresources $HOME/.Xresources
create_symlink ./config/.gitconfig $HOME/.gitconfig
create_symlink ./config/.ssh $HOME/.ssh
create_symlink ./config/hypr $HOME/.config/hypr
create_symlink ./config/i3 $HOME/.config/i3
create_symlink ./config/qtile $HOME/.config/qtile
create_symlink ./config/sway $HOME/.config/sway
create_symlink ./config/wofi $HOME/.config/wofi
create_symlink ./config/sxhkd $HOME/.config/sxhkd
create_symlink ./config/swhkd $HOME/.config/swhkd
create_symlink ./config/nvim $HOME/.config/nvim
create_symlink ./config/sioyek $HOME/.config/sioyek
create_symlink ./config/rofi $HOME/.config/rofi
create_symlink ./config/kitty $HOME/.config/kitty
create_symlink ./config/alacritty $HOME/.config/alacritty
create_symlink ./config/ranger $HOME/.config/ranger
create_symlink ./config/zsh $HOME/.config/zsh
create_symlink ./config/.zshrc $HOME/.zshrc
create_symlink ./config/frp /etc/frp
create_symlink ./config/joshuto $HOME/.config/joshuto
echo "$OK Soft links created."
