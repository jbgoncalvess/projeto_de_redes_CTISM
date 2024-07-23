#!/bin/bash

#Arquivo com os nomes e os da leases
leases_file="/var/lib/dhcp/dhcpd6.leases"

#leases_file="/tmp/pycore.1/dhcp.conf/var.lib.dhcp/dhcpd6.leases"
saida="hostnames_ipv6.txt"
dns_file="/etc/bind/db.jbgoncalvess.predes.ufsm.br"

#Pego os endereços IPv6 da leases do dhcpv6
ipv6_addresses=$(grep -oP 'iaaddr \K[^\s]+' "$leases_file")

#Verifico se os endereços foram encontrados
if [ -z "$ipv6_addresses" ]; then
	echo "Nenhum endereço IPv6 encontrado no arquivo de leases."
	exit 1
fi

#Teste
echo "Endereços IPv6 encontrados:"
echo "$ipv6_addresses"

#Credenciais de cada host
ssh_user="core"
ssh_password="87654321"

#Ler cada endereço IPv6 e obter o hostname via SSH
for ipv6 in $ipv6_addresses; do
	echo "Conectando-se a $ipv6..."

	#Obter o hostname via SSH
	hostname=$(sshpass -p "$ssh_password" ssh -o ConnectTimeout=10 -o StrictHostKeyChecking=no $ssh_user@$ipv6 hostname 2>/dev/null)

	if [ -z "$hostname" ]; then
		hostname="Não foi possível obter o hostname"
	fi

	if [ "$hostname" = "ns1" ]; then
        	ipv6_ns1=$ipv6
    	fi

    # Salvar o resultado no formato desejado
	echo "$hostname		AAAA		$ipv6" >> "$saida"

	echo "Hostname para $ipv6: $hostname"
done

echo "Resultados salvos em: $saida"
cat $saida

hostnames=$(awk '{print $1}' "$saida")

echo "$hostnames"

for host in $hostnames; do
	sed -i '/^'"$host"'\s\+AAAA\s/d' "$dns_file"
done

cat "$saida" >> "$dns_file"

#REINICIAR O SERVIDOR DNS PRA ATUALIZAR NA HORA
sshpass -p "$ssh_password" ssh -o ConnectTimeout=10 -o StrictHostKeyChecking=no $ssh_user@$ipv6_ns1 sudo pkill named 2>/dev/null
sshpass -p "$ssh_password" ssh -o ConnectTimeout=10 -o StrictHostKeyChecking=no $ssh_user@$ipv6_ns1 sudo named -c /etc/bind/named.conf 2>/dev/null

rm "/home/core/Desktop/controle/$saida"
echo "FINALIZOU"
