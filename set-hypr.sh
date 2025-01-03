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
  "stow"
  "kitty"
  "wezterm"
  "yazi"
  "dragon"
  "ffmpeg"
  "p7zip"
  "jq"
  "poppler"
  "fd"
  "ripgrep"
  "fzf"
  "zoxide"
  "imagemagick"

  "gnu-netcat"

  "zathura"
  "zathura-pdf-mupdf"

  "sway"
  "swaybg"
  "foot"
  "polkit"

  "watchexec"
  "unzip"
  "unarchiver"

  "ttf-firacode-nerd"
  "ttf-jetbrains-mono-nerd"
  "ttf-roboto-mono"
  "otf-comicshanns-nerd"

  "fcitx5-im"
  "fcitx5-chinese-addons"
  "fcitx5-material-color"

  "zsh"
  "tmux"
  "grim"
  "slurp"
  "swappy"
  "wl-clipboard"
  "cliphist"
  "feh"
  "xorg-xrandr"
  "xorg-xrdb"
  "nodejs"
  "npm"
  "mpv"
  "joshuto"
  "perl-image-exiftool"
  "nutstore-experimental"

  "polkit-gnome"

  "hyprland-git"
  "wlogout"
  "waybar"
  "swww"
  "mako"
  "swaync"
  "wofi"
  "grimblast"

  "i3"
  "polybar"
  "picom"
  "xclip"
  "rofi"

  "alsa-utils"
  "pipewire"
  "pulseaudio"
  "sof-firmware"
  "network-manager-applet"
  "v2raya"
  "nemo"
  "neovim"
  "joshuto"
  "microsoft-edge-stable"
  "google-chrome"
  "wps-office-cn"
  "libtiff5"
  "wps-office-mime-cn"
  "wps-office-mui-zh-cn"

  "cups"
  "linuxqq"
  "wechat"

  "nwg-look-bin"
  "network-manager-applet"
  # "bibata-cursor-theme"
  "nordic-theme"

  "texlive"
  "texlive-lang"
  "biber"

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
stow .
echo "$OK Soft links created."
