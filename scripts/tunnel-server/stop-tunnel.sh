#!/bin/bash
sysctl -w net.ipv4.conf.all.route_localnet=0
sysctl -w net.ipv4.ip_forward=0
iptables -t nat -D PREROUTING -p tcp --dport 25565 -j DNAT --to-destination 127.0.0.1:25565
iptables -D FORWARD -p tcp -d 127.0.0.1 --dport 25565 -j ACCEPT