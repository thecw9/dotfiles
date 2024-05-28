#/bin/bash
# Library of functions for the script
# Author: Jiawen Zuo

# ------------------------------------------------------
# Echo colored text
# ------------------------------------------------------
OK="$(tput setaf 2)[OK]$(tput sgr0)"
ERROR="$(tput setaf 1)[ERROR]$(tput sgr0)"
WARNING="$(tput setaf 3)[WARNING]$(tput sgr0)"
NOTE="$(tput setaf 3)[NOTE]$(tput sgr0)"
ACTION="$(tput setaf 6)[ACTION]$(tput sgr0)"

# ------------------------------------------------------
# Function: Is package installed in archlinux
# ------------------------------------------------------
function is_installed() {
	sudo pacman -Qi $1 &>/dev/null
	return $?
}

# ------------------------------------------------------
# Function Install all package if not installed
# ------------------------------------------------------
function install_packages() {
	for pkg in "${pkgs[@]}"; do
		if ! pacman -Qi "$pkg" &>/dev/null; then
			echo "$NOTE Installing $pkg..."
			paru -S "$pkg" --noconfirm --needed
		else
			echo "$NOTE $pkg already installed."
		fi
	done
}

# ------------------------------------------------------
# Create symbolic links
# ------------------------------------------------------
function create_symlink() {
	local source=$1
	local target=$2
	# remove target if exists
	if [ -e $target ]; then
		sudo rm -rf $target
	fi
	# get absolute path
	source=$(readlink -f $source)

	sudo ln -sf $source $target
	echo "$OK Symlink $source --> $target created."
}
