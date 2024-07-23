#!/bin/bash

iptables -F FORWARD
ip6tables -F FORWARD

iptables -P FORWARD DROP
ip6tables -P FORWARD DROP

iptables -A FORWARD -i eth1 -o eth0 -j ACCEPT
ip6tables -A FORWARD -i eth1 -o eth0 -j ACCEPT

iptables -A FORWARD -m conntrack --ctstate ESTABLISHED,RELATED -j ACCEPT
ip6tables -A FORWARD -m conntrack --ctstate ESTABLISHED,RELATED -j ACCEPT

#Liberar servidores acessiveis externamente
iptables -A FORWARD -d 200.18.74.64/27 -i eth0 -o eth1 -j ACCEPT
ip6tables -A FORWARD -d 2804:1f38:2001:700::/56 -i eth0 -o eth1 -j ACCEPT

