#!/bin/bash
/usr/bin/screen -S server-mcje-firewall -Dm /usr/bin/ssh -R 25565:0.0.0.0:25565 -F /home/arkapravo/.ssh/config Ark-Minecraft
