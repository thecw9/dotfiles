# general 
alias cd='z'

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

# Docker
alias rmdc='sudo docker rm -f $(sudo docker ps -qa)'
alias rmdi='sudo docker rmi $(sudo docker images -q)'

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
# Stop all running containers
alias dstop='sudo docker stop $(sudo docker ps -q)'

# Remove all containers
alias drm='sudo docker rm -f $(sudo docker ps -a -q)'

# List all running containers
alias dps='sudo docker ps'

# List all containers, including stopped containers
alias dpsa='sudo docker ps -a'

# Show the logs
alias dlogs="sudo docker logs -f"

# Get information about a container
alias din='sudo docker inspect'

# Enter a running container's shell
alias dshell='sudo docker exec -it'

# Remove all stopped containers
alias drm_stopped='sudo docker rm $(docker ps -a -f "status=exited" -q)'

# Remove all dangling images
alias drmi='sudo docker rmi $(docker images -f "dangling=true" -q)'

# Show Docker system-wide information
alias dinfo='sudo docker system info'

# Show Docker version information
alias dversion='sudo docker version'


# docker-compose
# Start all services defined in a Docker Compose file
alias dcompose-up='sudo docker-compose up'

# Stop and remove all containers, networks, and images created by `docker-compose up`
alias dcompose-down='sudo docker-compose down'

# Show the logs for all containers defined in a Docker Compose file
alias dcompose-logs='sudo docker-compose logs -f'

# Run a command in a container defined in a Docker Compose file
alias dcompose-exec='sudo docker-compose exec'

# Build and recreate services defined in a Docker Compose file
alias dcompose-recreate='sudo docker-compose up --build --force-recreate'

# List the containers created by `docker-compose up`
alias dcompose-ps='sudo docker-compose ps'

