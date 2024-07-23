#!/bin/bash

#SOMENTE PROFESSORES,DEPARTAMENTOS E SERVIDORES TEM ACESSO AS IMPRESSORAS
iptables -F FORWARD
ip6tables -F FORWARD

iptables -P FORWARD DROP
ip6tables -P FORWARD DROP

iptables -A FORWARD -i eth0 -o eth1 -s 172.16.6.0/23 -j ACCEPT
iptables -A FORWARD -i eth1 -o eth0 -d 172.16.6.0/23 -j ACCEPT

ip6tables -A FORWARD -i eth0 -o eth1 -s 2804:1f38:2001:a00::/56 -j ACCEPT
ip6tables -A FORWARD -i eth1 -o eth0 -d 2804:1f38:2001:a00::/56 -j ACCEPT

iptables -A FORWARD -i eth0 -o eth1 -s 172.16.9.0/24 -j ACCEPT
iptables -A FORWARD -i eth1 -o eth0 -d 172.16.9.0/24 -j ACCEPT

ip6tables -A FORWARD -i eth0 -o eth1 -s 2804:1f38:2001:c00::/56 -j ACCEPT
ip6tables -A FORWARD -i eth1 -o eth0 -d 2804:1f38:2001:c00::/56 -j ACCEPT

iptables -A FORWARD -i eth0 -o eth1 -s 172.16.5.0/24 -j ACCEPT
iptables -A FORWARD -i eth1 -o eth0 -d 172.16.5.0/24 -j ACCEPT

ip6tables -A FORWARD -i eth0 -o eth1 -s 2804:1f38:2001:600::/56 -j ACCEPT
ip6tables -A FORWARD -i eth1 -o eth0 -d 2804:1f38:2001:600::/56 -j ACCEPT
