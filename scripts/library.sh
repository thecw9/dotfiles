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
	local packages=$@
	local not_installed=()
	for package in $packages; do
		if ! is_installed $package; then
			not_installed+=($package)
		fi
	done
	if [ ${#not_installed[@]} -gt 0 ]; then
		echo "$ACTION Installing packages: ${not_installed[@]}"
		paru -S ${not_installed[@]}
	else
		echo "$NOTE All packages are installed."
	fi
}

# ------------------------------------------------------
# Create symbolic links
# ------------------------------------------------------
function create_symlink() {
	local source=$1
	local target=$2
	# get absolute path
	source=$(readlink -f $source)

	ln -sf $source $target
	echo "$OK Symlink $source --> $target created."
}
