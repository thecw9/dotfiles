# general
# add current directory to PYTHONPATH
alias addpy='export PYTHONPATH=$(pwd):$PYTHONPATH'

# nvim
alias nvim='export PYTHONPATH=$PYTHONPATH:$PWD; nvim'

# python
alias cv='python3 -m venv .venv'
alias av='source .venv/bin/activate'

# joshuto
alias jos='joshuto'

# watchexec
alias we='watchexec -r -c -e py'

# xrandr setting
alias xrandr-set="xrandr --output DP-0 --auto --output DP-3 --auto"

# some package
alias ra='ranger'
alias lgit='lazygit'

# WIFI
alias hotspot='nmcli device wifi > /dev/null; nmcli device wifi connect "Redmi Note 11T Pro" password 88888888'
alias campus='nmcli device wifi > /dev/null; nmcli device wifi connect csust-lt'

alias b5home='nmcli device wifi > /dev/null; nmcli device wifi connect @PHICOMM_68_5G password 13786474305'
alias bhome='nmcli device wifi > /dev/null; nmcli device wifi connect @PHICOMM_68 password 13786474305'
alias b2home='nmcli device wifi > /dev/null; nmcli device wifi connect TP-LINK_4D1C password a13786474305'
alias dhome='nmcli device wifi > /dev/null; nmcli device wifi connect ChinaNet-L7CL password 3hgaamyr'
alias fhome='nmcli device wifi > /dev/null;  nmcli device wifi connect TP-LINK_01A2 password hnhyxiao19900206'

# wireguard
alias wgconnect='sudo wg-quick up wg'
alias wgdisconnect='sudo wg-quick down wg'
alias wgstatus='sudo wg show'

# geph
alias geph-connect='sudo geph4-client connect --username Tj634967256 --password Tj0421@% --exit-server nl --vpn-mode tun-route'

# OpenVPN3
alias vpnconnect='sudo openvpn3 session-start --config /etc/openvpn/client.ovpn'
alias vpnstatus='sudo openvpn3 session-list'
alias vpndisconnect='sudo openvpn3 session-manage --session-id $(sudo openvpn3 session-list | grep -v "Session Name" | awk '{print $1}') --disconnect'

# networkmanager openvpn
alias nmimport='sudo nmcli connection import type openvpn file /etc/openvpn/client.ovpn'
alias nmdelete='sudo nmcli connection delete id "client"'
alias nmconnect='sudo nmcli connection up id "client"'
alias nmdisconnect='sudo nmcli connection down id "client"'
alias nmstatus='sudo nmcli connection show --active'
alias nmlist='sudo nmcli connection show'

# openvpn
alias ovpnconnect='sudo openvpn --config /etc/openvpn/client.ovpn'
alias ovpnstatus='sudo openvpn --status 10'
alias ovpndisconnect='sudo killall openvpn'
alias ovpnlist='sudo openvpn --show-adapters'

# Docker
alias docker-clean='sudo docker system prune -a'               # remove all stopped containers, all networks not used by at least one container, all dangling images, and all build cache
alias docker-clean-all='sudo docker system prune -a --volumes' # remove all stopped containers, all networks not used by at least one container, all images without at least one container associated to them, all build cache, and all volumes

alias docker-stop-all='sudo docker stop $(sudo docker ps -a -q)' # stop all running containers
alias docker-remove-all='sudo docker rm $(sudo docker ps -a -q)' # remove all containers

alias docker-remove-dangling='sudo docker rmi $(sudo docker images -f "dangling=true" -q)' # remove all dangling images
alias docker-remove-all-images='sudo docker rmi $(sudo docker images -q)'                  # remove all images

# docker-compose
alias docker-compose-up='sudo docker-compose up -d'                               # start services
alias docker-compose-rebuild='sudo docker-compose up -d --build --force-recreate' # rebuild services
alias docker-compose-down='sudo docker-compose down'                              # stop services
