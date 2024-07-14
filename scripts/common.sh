#/bin/sh

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
# Echo colored text
# ------------------------------------------------------
OK="$(tput setaf 2)[OK]$(tput sgr0)"
ERROR="$(tput setaf 1)[ERROR]$(tput sgr0)"
WARNING="$(tput setaf 3)[WARNING]$(tput sgr0)"
NOTE="$(tput setaf 3)[NOTE]$(tput sgr0)"
ACTION="$(tput setaf 6)[ACTION]$(tput sgr0)"

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
		echo 'Server = https://mirrors.tuna.tsinghua.edu.cn/archlinuxcn/$arch' | sudo tee -a /etc/pacman.conf
		echo "$OK ArchlinuxCN repo added."
		# import PGP key
		echo "$NOTE Importing PGP key..."
		sudo pacman-key --lsign-key "farseerfc@archlinux.org"
		sudo pacman -Sy archlinuxcn-keyring
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
	echo "$OK - paru was found."
	echo ""
else
	echo "Installing paru..."
	sudo pacman -S paru
fi


# check if TPM is installed and install it
echo ""
echo "-------------------------------------"
echo "$ACTION Installing TPM..."
echo "-------------------------------------"
if [ ! -d ~/.tmux/plugins/tpm ]; then
	git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
fi
