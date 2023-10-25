#/bin/sh

source $(dirname $0)/scripts/library.sh
clear
source $(dirname $0)/scripts/common.sh

# ------------------------------------------------------
# Basic Settings
# ------------------------------------------------------
echo ""
echo "-------------------------------------"
echo "$ACTION Configure the basic settings."
echo "-------------------------------------"
# navigation and move
gsettings set org.gnome.desktop.wm.keybindings move-to-workspace-left "['<Super>w']"
gsettings set org.gnome.desktop.wm.keybindings move-to-workspace-right "['<Super>s']"
gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-left "['<Super>a']"
gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-right "['<Super>d']"
# window
gsettings set org.gnome.desktop.wm.keybindings close "['<Super>q']"
gsettings set org.gnome.desktop.wm.keybindings toggle-fullscreen "['<Super>f']"
# appearance
gsettings set org.gnome.desktop.interface text-scaling-factor 1.33
echo "$OK The basic settings have been set."
