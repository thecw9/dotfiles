#!bin/zsh

function ya() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXX")"
	yazi "$@" --cwd-file="$tmp"
	if cwd="$(cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
		cd -- "$cwd"
	fi
	rm -f -- "$tmp"
}


setting(){
	gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-left  "['<Super>a']"
	gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-right  "['<Super>d']"
	gsettings set org.gnome.desktop.wm.keybindings move-to-workspace-left  "['<Super>w']"
	gsettings set org.gnome.desktop.wm.keybindings move-to-workspace-right  "['<Super>s']"
	gsettings set org.gnome.desktop.wm.keybindings close "['<Super>q']"
	gsettings set org.gnome.desktop.wm.keybindings toggle-maximized "['<Super>m']"
  gsettings set org.gnome.desktop.interface text-scaling-factor 1.4
  gsettings set org.gnome.desktop.interface gtk-theme Juno
  gsettings set org.gnome.desktop.wm.preferences theme Juno
}


csust-connect(){
  # ping baidu.com -c 1 || nmcli device wifi > /dev/null || nmcli device wifi connect csust-lt
  python3 $HOME/.config/zsh/scripts/csust-network-login/log2network.py
}

archvm-install(){
  virt-install \
    --name archlinux \
    --ram 2048 \
    --disk path=/var/lib/libvirt/images/archlinux.qcow2,size=20 \
    --vcpus 2 \
    --network bridge=virbr0 \
    --console pty,target_type=serial \
    --cdrom /var/lib/libvirt/isos/archlinux-x86_64.iso
}
winvm-install(){
  virt-install \
    --name win11 \
    --ram 4096 \
    --disk path=/var/lib/libvirt/images/win11.qcow2,size=20 \
    --vcpus 2 \
    --network bridge=virbr0 \
    --console pty,target_type=serial \
    --cdrom /var/lib/libvirt/isos/Win11_22H2_China_GGK_Chinese_Simplified_x64v2.iso
}
