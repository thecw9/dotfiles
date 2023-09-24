#/bin/bash


OK="$(tput setaf 2)[OK]$(tput sgr0)"
ERROR="$(tput setaf 1)[ERROR]$(tput sgr0)"
WARNING="$(tput setaf 3)[WARNING]$(tput sgr0)"
NOTE="$(tput setaf 3)[NOTE]$(tput sgr0)"
ACTION="$(tput setaf 6)[ACTION]$(tput sgr0)"
LOG="install.log"


# set the scipt to exit immediately if any command exits with a non-zero status
set -e
echo "$(tput setaf 2)Welcome to the Arch Linux YAY Hyprland installer! $(tput sgr0)"

read -p "Enter the username you want to setup (Default: thecw): " USER
USER=${USER:-thecw}

# Check user permission
if [ $EUID -ne 0 ]; then
  echo "$ERROR This script must be run as root" 1>&2
  exit 1
fi

echo -e "$NOTE PLEASE BACKUP YOUR FILES BEFORE PROCEEDING! \
This script will overwrite some of your configs and files!"

# add archlinuxcn repo
if grep -q "[archlinuxcn]" /etc/pacman.conf; then
  echo 
  echo -e "$OK - ArchlinuxCN repo already exists. No need to add."
else
  echo
  read -p "$ACTION - Would you like to add ArchlinuxCN repo? [Y/n] " choice
  if [ "$choice" == "y" ] || [ "$choice" == "Y" ] || [ "$choice" == "" ]; then
    echo "$NOTE Adding ArchlinuxCN repo..."
    echo "" >>/etc/pacman.conf
    echo "[archlinuxcn]" >>/etc/pacman.conf
    echo "Server = https://repo.archlinuxcn.org/\$arch" >>/etc/pacman.conf
    echo "$OK ArchlinuxCN repo added."
    # import PGP key
    echo "$NOTE Importing PGP key..."
    pacman -Sy && pacman -S archlinuxcn-keyring
  else
    echo "$WARNING Skipping add ArchlinuxCN repo"
  fi
fi


# install paru
if command -v paru &>/dev/null; then
  echo ""
  echo "$OK - paru was found."
  echo ""
else
  echo "$NOTE - paru was not found."
  read -p "$ACTION Would you like to install paru? [Y/n] " choice
  if [ "$choice" == "y" ] || [ "$choice" == "Y" ] || [ "$choice" == "" ]; then
    pacman -S paru
  else
    echo "$WARNING Skipping install paru"
  fi
fi

# function to install packages 
install_packages() {
  echo "$NOTE Installing $@..." 
  if ! paru -S --needed --noconfirm $@ 2>&1 | tee -a $LOG; then
    echo "$ERROR Failed to install $@. Please check $LOG for more details."
    exit 1
  fi
  echo "$OK Packages installed."
}

# install font
read -p "$ACTION Would you like to install font packages? [Y/n] " choice
font_pkgs="ttf-firacode-nerd ttf-jetbrains-mono-nerd ttf-roboto-mono"
if [ "$choice" == "y" ] || [ "$choice" == "Y" ] || [ "$choice" == "" ]; then
  install_packages $font_pkgs
  echo
else
  echo "$WARNING Skipping install font packages"
fi

# install VM-related Packages
vm_pkgs="qemu libvirt virt-viewer virt-manager virt-install"
read -p "$ACTION Would you like to install VM-related packages? [Y/n] " choice
if [ "$choice" == "n" ] || [ "$choice" == "N" ] || [ "$choice" == "" ]; then
  echo "$WARNING Skipping install VM-related packages"
else
  install_packages $vm_pkgs
  echo
fi


# install zsh-related Packages
zsh_pkgs="zsh"
read -p "$ACTION Would you like to install zsh-related packages? [Y/n] " choice
if [ "$choice" == "y" ] || [ "$choice" == "Y" ] || [ "$choice" == "" ]; then
  install_packages $zsh_pkgs
  echo

  # check if oh-my-zsh is installed
  if [ ! -d /home/$USER/.oh-my-zsh ]; then
    read -p "Oh-my-zsh not found. Would you like to install Oh-my-zsh? [Y/n] " choice
    if [ "$choice" == "y" ] || [ "$choice" == "Y" ] || [ "$choice" == "" ]; then
      su - $USER -c sh -c "$(wget https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh -O -)"
    else
      echo "$WARNING Skipping install oh-my-zsh"
    fi
  fi

  # check if zsh-autosuggestions is installed
  if [ ! -d ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions ]; then
    read -p "Zsh-autosuggestions not found. Would you like to install zsh-autosuggestions? [Y/n] " choice
    if [ "$choice" == "y" ] || [ "$choice" == "Y" ] || [ "$choice" == "" ]; then
      git clone https://github.com/zsh-users/zsh-autosuggestions /home/$USER/.oh-my-zsh/custom/plugins/zsh-autosuggestions
    else
      echo "$WARNING Skipping install zsh-autosuggestions"
    fi
  fi
else
  echo "$WARNING Skipping install zsh-related packages"
fi



# function to create soft links for config file
create_soft_links() {
	# check if the file or directory exists
	if [ -e $2 ]; then
		sudo rm -rf $2
	fi
	if ! ln -sf $1 $2 2>&1 | tee -a $LOG; then
    echo "$ERROR Failed to create soft link for $1. Please check $LOG for more details."
    exit 1
  else
    echo "$OK Soft link for $2 created."
  fi
}

read -p "$ACTION Would you like to create soft links for config files? [Y/n] " choice
if [ "$choice" == "y" ] || [ "$choice" == "Y" ] || [ "$choice" == "" ]; then
  create_soft_links /home/$USER/.dotfiles/config/.Xresources /home/$USER/.Xresources
  create_soft_links /home/$USER/.dotfiles/config/.gitconfig /home/$USER/.gitconfig
  create_soft_links /home/$USER/.dotfiles/config/.ssh /home/$USER/.ssh
  create_soft_links /home/$USER/.dotfiles/config/i3 /home/$USER/.config/i3
  create_soft_links /home/$USER/.dotfiles/config/qtile /home/$USER/.config/qtile
  create_soft_links /home/$USER/.dotfiles/config/sway /home/$USER/.config/sway
  create_soft_links /home/$USER/.dotfiles/config/wofi /home/$USER/.config/wofi
  create_soft_links /home/$USER/.dotfiles/config/waybar /home/$USER/.config/waybar
  create_soft_links /home/$USER/.dotfiles/config/sxhkd /home/$USER/.config/sxhkd
  create_soft_links /home/$USER/.dotfiles/config/swhkd /home/$USER/.config/swhkd
  create_soft_links /home/$USER/.dotfiles/config/hypr /home/$USER/.config/hypr
  create_soft_links /home/$USER/.dotfiles/config/nvim /home/$USER/.config/nvim
  create_soft_links /home/$USER/.dotfiles/config/sioyek /home/$USER/.config/sioyek
  create_soft_links /home/$USER/.dotfiles/config/rofi /home/$USER/.config/rofi
  create_soft_links /home/$USER/.dotfiles/config/kitty /home/$USER/.config/kitty
  create_soft_links /home/$USER/.dotfiles/config/alacritty /home/$USER/.config/alacritty
  create_soft_links /home/$USER/.dotfiles/config/ranger /home/$USER/.config/ranger
  create_soft_links /home/$USER/.dotfiles/config/zsh /home/$USER/.config/zsh
  create_soft_links /home/$USER/.dotfiles/config/.zshrc /home/$USER/.zshrc
  create_soft_links /home/$USER/.dotfiles/config/frp /etc/frp
  create_soft_links /home/$USER/.dotfiles/config/joshuto /home/$USER/.config/joshuto
  create_soft_links /home/$USER/.dotfiles/config/eww /home/$USER/.config/eww
  echo "$OK Soft links created."
  echo
else
  echo "$WARNING Skipping create soft links for config file"
fi




