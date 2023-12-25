# Minecraft Server Resources

## Description

This repository contains the resources used by the Minecraft Server Creators.
> **NOTE:** This repository is configured for the username `arkapravo` and the hostname `Ark-Minecraft`. If you want to change this, kindly go through all the scripts.

## Server Documentation

Preferably, the server should be run on a Raspberry Pi 4 with 4GB of RAM or higher. Alternatively, a computer with similar or better specs can be used. Please note that the server should only be running on GNU/Linux Distributions.

### [minecraft-server](scripts/minecraft-server)

This directory contains everything needed for the Minecraft Server to run. Do install screen and java 16 or higher on the server, and check the path of java in [start-server.sh](scripts/minecraft-server/server-mcje/start-server.sh) Breaking down the directory, we have:

- [server-mcje](scripts/minecraft-server/server-mcje): This directory contains the Minecraft Java Edition Server (PaperMC) and all of its configuration files. It should be placed under `/home/arkapravo`. It also has LoginSecurity, Geyser-Spigot, GeyserUpdater and ViaVersion plugins installed and configured properly inside the [plugins](scripts/minecraft-server/server-mcje/plugins) directory with no telemetry setup. To update them, just replace the jar files with the new ones and restart the server.

- [services](scripts/minecraft-server/services): This directory contains the services that are used to run the server. It has the [server-mcje.service](scripts/minecraft-server/services/server-mcje.service) file, which is the service that runs the Minecraft Java Edition Server, and the [server-mcje-firewall.service](scripts/minecraft-server/services/server-mcje-firewall.service) file, which is the service that runs the firewall for the Minecraft Java Edition Server. To install them, just copy the files to the `/etc/systemd/system` directory and run `sudo systemctl daemon-reload`. To enable and start them, run `sudo systemctl enable --now server-mcje.service` and `sudo systemctl enable --now server-mcje-firewall.service` respectively. The firewall service executes the script [start-firewall.sh](scripts/minecraft-server/server-mcje/start-firewall.sh) which is responsible for setting up the SSH Tunneling from the server to whatever server you configure in your ssh config with the name "Ark-Minecraft" for host, and the server service executes the script [start-server.sh](scripts/minecraft-server/server-mcje/start-server.sh) which is responsible for starting the server.
> **NOTE:** If you want to change the username and hostname, kindly go through the scripts and change them accordingly.

### [tunnel-server](scripts/tunnel-server)

This directory contains everything needed for the SSH Tunneling Server to run. The SSH Tunneling Server is used to connect to the Minecraft Server from outside the network for those who do not have port forwarding facilities in their network. This can be any Cloud Server running any GNU/Linux Distribution with iptables installed. We have two simple scripts under this directory which must be run as root user, which are [start-tunnel.sh](scripts/tunnel-server/start-tunnel.sh) and [stop-tunnel.sh](scripts/tunnel-server/stop-tunnel.sh). The former is responsible for starting the SSH Tunnel's Port Forwarding Rules and the latter is responsible for stopping the SSH Tunnel's Port Forwarding Rules using iptables. You can keep the rules running all the time, but it is recommended to stop them when not in use to avoid any exceedence of the Cloud Server's bandwidth limit.

## Plugins
- [LoginSecurity](https://www.spigotmc.org/resources/loginsecurity.19362)
- [ViaVersion](https://github.com/ViaVersion/ViaVersion/releases)
- [Geyser-Spigot](https://geysermc.org/download)
> **NOTE:** This plugin is automatically updated by GeyserUpdater plugin.
- [GeyserUpdater](https://ci.kejonamc.dev/job/GeyserUpdater/job/main)