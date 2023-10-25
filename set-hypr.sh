#/bin/bash
# Description: Install script for Arch Linux
# Author: Jiawen Zuo

source $(dirname $0)/scripts/library.sh
clear
source $(dirname $0)/scripts/common.sh

# ------------------------------------------------------
# Install Applications
# ------------------------------------------------------
echo ""
echo "-------------------------------------"
echo "$ACTION Installing applications..."
echo "-------------------------------------"
pkgs=(
	"ttf-firacode-nerd"
	"ttf-jetbrains-mono-nerd"
	"ttf-roboto-mono"

	"fcitx5-im"
	"fcitx5-chinese-addons"
	"fcitx5-material-color"

	"zsh"
	"wl-clipboard"
	"zoxide"
	"xorg-xrandr"
	"xorg-xrdb"
	"nodejs"
	"npm"
	"mpv"
	"joshuto"
	"nutstore"

	"texlive"
	"texlive-lang"
	"biber"

	"polkit-gnome"

	"hyprland"
	"eww"
	"waybar"
	"swww"
	"mako"
	"swaync"
	"wofi"

	"alsa-utils"
	"sof-firmware"
	"network-manager-applet"
	"v2raya"
	"nemo"
	"neovim"
	"joshuto"
	"google-chrome"
	"wps-office-cn"
	"libtiff5"
	"wps-office-mime-cn"
	"wps-office-mui-zh-cn"
	"wps-office-fonts"
	"ttf-wps-fonts"
	"cups"
	"linuxqq"
	"wechat-uos"
	"feishu-bin"

	"bibata-cursor-theme"
	"nordic-theme"
)
install_packages $pkgs

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
