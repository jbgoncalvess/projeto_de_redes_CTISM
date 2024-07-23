#!/bin/bash

echo "Digite um endereço IPv4 para liberar o acesso à impressora:"
echo "ATENÇÃO: O endereço pode ser um host ou uma sub-rede no formato CIDR."

read ip

#Verificar se e sub-rede ipv6
n=$(echo "$ip" | rev | cut -c 3)
echo "$n"

# ip de host
if echo "$ip" | grep -P '^\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3}$' > /dev/null; then
	REGRA_UM="-A FORWARD -s $ip/32 -i eth0 -o eth1 -j ACCEPT"
	REGRA_DOIS="-A FORWARD -d $ip/32 -i eth1 -o eth0 -j ACCEPT"
        REGRA_UM_DEL="-D FORWARD -s $ip/32 -i eth0 -o eth1 -j ACCEPT"
        REGRA_DOIS_DEL="-D FORWARD -d $ip/32 -i eth1 -o eth0 -j ACCEPT"

	iptables-save | grep -- "$REGRA_UM" > /dev/null
	if [ $? -ne 0 ]; then
		iptables $REGRA_UM
		iptables $REGRA_DOIS
		echo "USUÁRIO $ip COM ACESSO LIBERADO AS IMPRESSORAS."
	else
		iptables $REGRA_UM_DEL
		iptables $REGRA_DOIS_DEL
		echo "USUÁRIO $ip COM ACESSO RETIRADO AS IMPRESSORAS."
	fi

# ip de sub-rede
elif echo "$ip" | grep -P '^\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3}/\d{1,2}$' > /dev/null; then
        REGRA_UM="-A FORWARD -s $ip -i eth0 -o eth1 -j ACCEPT"
        REGRA_DOIS="-A FORWARD -d $ip -i eth1 -o eth0 -j ACCEPT"
        REGRA_UM_DEL="-D FORWARD -s $ip -i eth0 -o eth1 -j ACCEPT"
        REGRA_DOIS_DEL="-D FORWARD -d $ip -i eth1 -o eth0 -j ACCEPT"

        iptables-save | grep -- "$REGRA_UM" > /dev/null
        if [ $? -ne 0 ]; then
                iptables $REGRA_UM
                iptables $REGRA_DOIS
                echo "SUB-REDE $ip COM ACESSO LIBERADO AS IMPRESSORAS."
        else
                iptables $REGRA_UM_DEL
                iptables $REGRA_DOIS_DEL
                echo "SUB-REDE $ip COM ACESSO RETIRADO AS IMPRESSORAS."
	fi

# sub-rede ipv6
elif [ "$n" = "/" ]; then
	REGRA_UM="-A FORWARD -s $ip -i eth0 -o eth1 -j ACCEPT"
        REGRA_DOIS="-A FORWARD -d $ip -i eth1 -o eth0 -j ACCEPT"
        REGRA_UM_DEL="-D FORWARD -s $ip -i eth0 -o eth1 -j ACCEPT"
        REGRA_DOIS_DEL="-D FORWARD -d $ip -i eth1 -o eth0 -j ACCEPT"

	ip6tables-save | grep -- "$REGRA_UM" > /dev/null
        if [ $? -ne 0 ]; then
                ip6tables $REGRA_UM
                ip6tables $REGRA_DOIS
                echo "SUB-REDE $ip COM ACESSO LIBERADO AS IMPRESSORAS."
        else
                ip6tables $REGRA_UM_DEL
                ip6tables $REGRA_DOIS_DEL
                echo "SUB-REDE $ip COM ACESSO RETIRADO AS IMPRESSORAS."
        fi

#host ipv6
else
        REGRA_UM="-A FORWARD -s $ip/128 -i eth0 -o eth1 -j ACCEPT"
        REGRA_DOIS="-A FORWARD -d $ip/128 -i eth1 -o eth0 -j ACCEPT"
        REGRA_UM_DEL="-D FORWARD -s $ip/128 -i eth0 -o eth1 -j ACCEPT"
        REGRA_DOIS_DEL="-D FORWARD -d $ip/128 -i eth1 -o eth0 -j ACCEPT"

        ip6tables-save | grep -- "$REGRA_UM" > /dev/null
        if [ $? -ne 0 ]; then
                ip6tables $REGRA_UM
                ip6tables $REGRA_DOIS
                echo "USUÁRIO $ip COM ACESSO LIBERADO AS IMPRESSORAS."
        else
                ip6tables $REGRA_UM_DEL
                ip6tables $REGRA_DOIS_DEL
                echo "USUÁRIO $ip COM ACESSO RETIRADO AS IMPRESSORAS."
        fi

fi
