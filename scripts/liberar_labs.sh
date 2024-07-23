#!/bin/bash

echo "DIGITE O VALOR PARA O LABORATÓRIO QUE DESEJA BLOQUEAR/DESBLOQUEAR A CONEXÃO COM A INTERNET:"
echo "1 - INFORMÁTICA 01\n2 - INFORMÁTICA 02\n3 - INFORMÁTICA 03\n4 - INFORMÁTICA 04\n5 - INFORMÁTICA 05\n6 - INFORMÁTICA 06"
echo "7 - REDES 01\n8 - REDES 02\n9 - HARDWARE 01\n10 - MODELAGEM 01\n11 - MODELAGEM 02\n12 - ELETRÔNICA 01\n13 - ELETRÔNICA 02\n14 - ELETRÔNICA 03\n15 - ELETRÔNICA 04\n16 - GENÉRICO 01"

read opcao

case $opcao in
	1)
		REGRA="-I FORWARD -i eth1 -o eth0 -m iprange --src-range 172.16.14.2-172.16.14.41 -j DROP"
		REGRA6="-I FORWARD -i eth1 -o eth0 -s 2804:1f38:2001:1000::/56 -j DROP"
		REGRA_DEL="-D FORWARD -i eth1 -o eth0 -m iprange --src-range 172.16.14.2-172.16.14.41 -j DROP"
		REGRA6_DEL="-D FORWARD -i eth1 -o eth0 -s 2804:1f38:2001:1000::/56 -j DROP"

		iptables-save | grep -- "$REGRA" > /dev/null

		if [ $? -ne 0 ]; then
			iptables $REGRA
			ip6tables $REGRA6
		        echo "LABORATÓRIO DE INFORMÁTICA 01 BLOQUEADO."
		else
			iptables $REGRA_DEL
			ip6tables $REGRA6_DEL
			echo "LABORATÓRIO DE INFORMÁTICA 01 DESBLOQUEADO PARA INTERNET."
		fi
	;;

        2)
                REGRA="-A FORWARD -i eth1 -o eth0 -m iprange --src-range 172.16.14.42-172.16.14.81 -j DROP"
                REGRA6="-A FORWARD -i eth1 -o eth0 -s 2804:1f38:2001:1000::/56 -j DROP"
                REGRA_DEL="-D FORWARD -i eth1 -o eth0 -m iprange --src-range 172.16.14.42-172.16.14.81 -j DROP"
                REGRA6_DEL="-D FORWARD -i eth1 -o eth0 -s 2804:1f38:2001:1000::/56 -j DROP"

                iptables-save | grep -- "$REGRA" > /dev/null

                if [ $? -ne 0 ]; then
                        iptables $REGRA
                        ip6tables $REGRA6
                        echo "LABORATÓRIO DE INFORMÁTICA 02 BLOQUEADO."
                else
                        iptables $REGRA_DEL
                        ip6tables $REGRA6_DEL
                        echo "LABORATÓRIO DE INFORMÁTICA 02 DESBLOQUEADO PARA INTERNET."
                fi
        ;;

        3)
                REGRA="-A FORWARD -i eth1 -o eth0 -m iprange --src-range 172.16.14.82-172.16.14.121 -j DROP"
                REGRA6="-A FORWARD -i eth1 -o eth0 -s 2804:1f38:2001:1000::/56 -j DROP"
                REGRA_DEL="-D FORWARD -i eth1 -o eth0 -m iprange --src-range 172.16.14.82-172.16.14.121 -j DROP"
                REGRA6_DEL="-D FORWARD -i eth1 -o eth0 -s 2804:1f38:2001:1000::/56 -j DROP"

                iptables-save | grep -- "$REGRA" > /dev/null

                if [ $? -ne 0 ]; then
                        iptables $REGRA
                        ip6tables $REGRA6
                        echo "LABORATÓRIO DE INFORMÁTICA 03 BLOQUEADO."
                else
                        iptables $REGRA_DEL
                        ip6tables $REGRA6_DEL
                        echo "LABORATÓRIO DE INFORMÁTICA 03 DESBLOQUEADO PARA INTERNET."
                fi
        ;;

        4)
                REGRA="-A FORWARD -i eth1 -o eth0 -m iprange --src-range 172.16.14.122-172.16.14.161 -j DROP"
                REGRA6="-A FORWARD -i eth1 -o eth0 -s 2804:1f38:2001:1000::/56 -j DROP"
                REGRA_DEL="-D FORWARD -i eth1 -o eth0 -m iprange --src-range 172.16.14.122-172.16.14.161 -j DROP"
                REGRA6_DEL="-D FORWARD -i eth1 -o eth0 -s 2804:1f38:2001:1000::/56 -j DROP"

                iptables-save | grep -- "$REGRA" > /dev/null

                if [ $? -ne 0 ]; then
                        iptables $REGRA
                        ip6tables $REGRA6
                        echo "LABORATÓRIO DE INFORMÁTICA 04 BLOQUEADO."
                else
                        iptables $REGRA_DEL
                        ip6tables $REGRA6_DEL
                        echo "LABORATÓRIO DE INFORMÁTICA 04 DESBLOQUEADO PARA INTERNET."
                fi
        ;;

        5)
                REGRA="-A FORWARD -i eth1 -o eth0 -m iprange --src-range 172.16.14.162-172.16.14.201 -j DROP"
                REGRA6="-A FORWARD -i eth1 -o eth0 -s 2804:1f38:2001:1000::/56 -j DROP"
                REGRA_DEL="-D FORWARD -i eth1 -o eth0 -m iprange --src-range 172.16.14.122-162.16.14.201 -j DROP"
                REGRA6_DEL="-D FORWARD -i eth1 -o eth0 -s 2804:1f38:2001:1000::/56 -j DROP"

                iptables-save | grep -- "$REGRA" > /dev/null

                if [ $? -ne 0 ]; then
                        iptables $REGRA
                        ip6tables $REGRA6
                        echo "LABORATÓRIO DE INFORMÁTICA 05 BLOQUEADO."
                else
                        iptables $REGRA_DEL
                        ip6tables $REGRA6_DEL
                        echo "LABORATÓRIO DE INFORMÁTICA 05 DESBLOQUEADO PARA INTERNET."
                fi
        ;;

        6)
                REGRA="-A FORWARD -i eth1 -o eth0 -m iprange --src-range 172.16.14.202-172.16.14.241 -j DROP"
                REGRA6="-A FORWARD -i eth1 -o eth0 -s 2804:1f38:2001:1000::/56 -j DROP"
                REGRA_DEL="-D FORWARD -i eth1 -o eth0 -m iprange --src-range 172.16.14.202-172.16.14.241 -j DROP"
                REGRA6_DEL="-D FORWARD -i eth1 -o eth0 -s 2804:1f38:2001:1000::/56 -j DROP"

                iptables-save | grep -- "$REGRA" > /dev/null

                if [ $? -ne 0 ]; then
                        iptables $REGRA
                        ip6tables $REGRA6
                        echo "LABORATÓRIO DE INFORMÁTICA 06 BLOQUEADO."
                else
                        iptables $REGRA_DEL
                        ip6tables $REGRA6_DEL
                        echo "LABORATÓRIO DE INFORMÁTICA 06 DESBLOQUEADO PARA INTERNET."
                fi
        ;;

        7)
                REGRA="-A FORWARD -i eth1 -o eth0 -m iprange --src-range 172.16.12.2-172.16.12.127 -j DROP"
                REGRA6="-A FORWARD -i eth1 -o eth0 -s 2804:1f38:2001:f00::/56 -j DROP"
                REGRA_DEL="-D FORWARD -i eth1 -o eth0 -m iprange --src-range 172.16.12.2-172.16.12.127 -j DROP"
                REGRA6_DEL="-D FORWARD -i eth1 -o eth0 -s 2804:1f38:2001:f00::/56 -j DROP"

                iptables-save | grep -- "$REGRA" > /dev/null

                if [ $? -ne 0 ]; then
                        iptables $REGRA
                        ip6tables $REGRA6
                        echo "LABORATÓRIO DE REDES 01 BLOQUEADO."
                else
                        iptables $REGRA_DEL
                        ip6tables $REGRA6_DEL
                        echo "LABORATÓRIO DE REDES 01 DESBLOQUEADO PARA INTERNET."
                fi
        ;;

        8)
                REGRA="-A FORWARD -i eth1 -o eth0 -m iprange --src-range 172.16.12.128-172.16.12.254 -j DROP"
                REGRA6="-A FORWARD -i eth1 -o eth0 -s 2804:1f38:2001:f00::/56 -j DROP"
                REGRA_DEL="-D FORWARD -i eth1 -o eth0 -m iprange --src-range 172.16.12.128-172.16.12.254 -j DROP"
                REGRA6_DEL="-D FORWARD -i eth1 -o eth0 -s 2804:1f38:2001:f00::/56 -j DROP"

                iptables-save | grep -- "$REGRA" > /dev/null

                if [ $? -ne 0 ]; then
                        iptables $REGRA
                        ip6tables $REGRA6
                        echo "LABORATÓRIO DE REDES 02 BLOQUEADO."
                else
                        iptables $REGRA_DEL
                        ip6tables $REGRA6_DEL
                        echo "LABORATÓRIO DE REDES 02 DESBLOQUEADO PARA INTERNET."
                fi
        ;;

        9)
                REGRA="-A FORWARD -i eth1 -o eth0 -m iprange --src-range 172.16.11.2-172.16.11.254 -j DROP"
                REGRA6="-A FORWARD -i eth1 -o eth0 -s 2804:1f38:2001:e00::/56 -j DROP"
                REGRA_DEL="-D FORWARD -i eth1 -o eth0 -m iprange --src-range 172.16.11.2-172.16.11.254 -j DROP"
                REGRA6_DEL="-D FORWARD -i eth1 -o eth0 -s 2804:1f38:2001:e00::/56 -j DROP"

                iptables-save | grep -- "$REGRA" > /dev/null

                if [ $? -ne 0 ]; then
                        iptables $REGRA
                        ip6tables $REGRA6
                        echo "LABORATÓRIO DE HARDWARE 01 BLOQUEADO."
                else
                        iptables $REGRA_DEL
                        ip6tables $REGRA6_DEL
                        echo "LABORATÓRIO DE HARDWARE 01 DESBLOQUEADO PARA INTERNET."
                fi
        ;;

        10)
                REGRA="-A FORWARD -i eth1 -o eth0 -m iprange --src-range 172.16.4.2-172.16.4.127 -j DROP"
                REGRA6="-A FORWARD -i eth1 -o eth0 -s 2804:1f38:2001:500::/56 -j DROP"
                REGRA_DEL="-D FORWARD -i eth1 -o eth0 -m iprange --src-range 172.16.4.2-172.16.4.127 -j DROP"
                REGRA6_DEL="-D FORWARD -i eth1 -o eth0 -s 2804:1f38:2001:500::/56 -j DROP"

                iptables-save | grep -- "$REGRA" > /dev/null

                if [ $? -ne 0 ]; then
                        iptables $REGRA
                        ip6tables $REGRA6
                        echo "LABORATÓRIO DE MODELAGEM 01 BLOQUEADO."
                else
                        iptables $REGRA_DEL
                        ip6tables $REGRA6_DEL
                        echo "LABORATÓRIO DE MODELAGEM 01 DESBLOQUEADO PARA INTERNET."
                fi
        ;;

        11)
                REGRA="-A FORWARD -i eth1 -o eth0 -m iprange --src-range 172.16.4.128-172.16.4.254 -j DROP"
                REGRA6="-A FORWARD -i eth1 -o eth0 -s 2804:1f38:2001:500::/56 -j DROP"
                REGRA_DEL="-D FORWARD -i eth1 -o eth0 -m iprange --src-range 172.16.4.128-172.16.4.254 -j DROP"
                REGRA6_DEL="-D FORWARD -i eth1 -o eth0 -s 2804:1f38:2001:500::/56 -j DROP"

                iptables-save | grep -- "$REGRA" > /dev/null

                if [ $? -ne 0 ]; then
                        iptables $REGRA
                        ip6tables $REGRA6
                        echo "LABORATÓRIO DE MODELAGEM 02 BLOQUEADO."
                else
                        iptables $REGRA_DEL
                        ip6tables $REGRA6_DEL
                        echo "LABORATÓRIO DE MODELAGEM 02 DESBLOQUEADO PARA INTERNET."
                fi
        ;;

        12)
                REGRA="-A FORWARD -i eth1 -o eth0 -m iprange --src-range 172.16.10.2-172.16.10.61 -j DROP"
                REGRA6="-A FORWARD -i eth1 -o eth0 -s 2804:1f38:2001:d00::/56 -j DROP"
                REGRA_DEL="-D FORWARD -i eth1 -o eth0 -m iprange --src-range 172.16.10.2-172.16.10.61 -j DROP"
                REGRA6_DEL="-D FORWARD -i eth1 -o eth0 -s 2804:1f38:2001:d00::/56 -j DROP"

                iptables-save | grep -- "$REGRA" > /dev/null

                if [ $? -ne 0 ]; then
                        iptables $REGRA
                        ip6tables $REGRA6
                        echo "LABORATÓRIO DE ELETRONICA 01 BLOQUEADO."
                else
                        iptables $REGRA_DEL
                        ip6tables $REGRA6_DEL
                        echo "LABORATÓRIO DE ELETRONICA 01 DESBLOQUEADO PARA INTERNET."
                fi
        ;;

        13)
                REGRA="-A FORWARD -i eth1 -o eth0 -m iprange --src-range 172.16.10.62-172.16.10.121 -j DROP"
                REGRA6="-A FORWARD -i eth1 -o eth0 -s 2804:1f38:2001:d00::/56 -j DROP"
                REGRA_DEL="-D FORWARD -i eth1 -o eth0 -m iprange --src-range 172.16.10.62-172.16.10.121 -j DROP"
                REGRA6_DEL="-D FORWARD -i eth1 -o eth0 -s 2804:1f38:2001:d00::/56 -j DROP"

                iptables-save | grep -- "$REGRA" > /dev/null

                if [ $? -ne 0 ]; then
                        iptables $REGRA
                        ip6tables $REGRA6
                        echo "LABORATÓRIO DE ELETRONICA 02 BLOQUEADO."
                else
                        iptables $REGRA_DEL
                        ip6tables $REGRA6_DEL
                        echo "LABORATÓRIO DE ELETRONICA 02 DESBLOQUEADO PARA INTERNET."
                fi
        ;;

        14)
                REGRA="-A FORWARD -i eth1 -o eth0 -m iprange --src-range 172.16.10.122-172.16.10.181 -j DROP"
                REGRA6="-A FORWARD -i eth1 -o eth0 -s 2804:1f38:2001:d00::/56 -j DROP"
                REGRA_DEL="-D FORWARD -i eth1 -o eth0 -m iprange --src-range 172.16.10.122-172.16.10.181 -j DROP"
                REGRA6_DEL="-D FORWARD -i eth1 -o eth0 -s 2804:1f38:2001:d00::/56 -j DROP"

                iptables-save | grep -- "$REGRA" > /dev/null

                if [ $? -ne 0 ]; then
                        iptables $REGRA
                        ip6tables $REGRA6
                        echo "LABORATÓRIO DE ELETRONICA 03 BLOQUEADO."
                else
                        iptables $REGRA_DEL
                        ip6tables $REGRA6_DEL
                        echo "LABORATÓRIO DE ELETRONICA 03 DESBLOQUEADO PARA INTERNET."
                fi
        ;;

        15)
                REGRA="-A FORWARD -i eth1 -o eth0 -m iprange --src-range 172.16.10.182-172.16.10.241 -j DROP"
                REGRA6="-A FORWARD -i eth1 -o eth0 -s 2804:1f38:2001:d00::/56 -j DROP"
                REGRA_DEL="-D FORWARD -i eth1 -o eth0 -m iprange --src-range 172.16.10.182-172.16.10.241 -j DROP"
                REGRA6_DEL="-D FORWARD -i eth1 -o eth0 -s 2804:1f38:2001:d00::/56 -j DROP"

                iptables-save | grep -- "$REGRA" > /dev/null

                if [ $? -ne 0 ]; then
                        iptables $REGRA
                        ip6tables $REGRA6
                        echo "LABORATÓRIO DE ELETRONICA 04 BLOQUEADO."
                else
                        iptables $REGRA_DEL
                        ip6tables $REGRA6_DEL
                        echo "LABORATÓRIO DE ELETRONICA 04 DESBLOQUEADO PARA INTERNET."
                fi
        ;;

        16)
                REGRA="-A FORWARD -i eth1 -o eth0 -m iprange --src-range 172.16.3.2-172.16.3.254 -j DROP"
                REGRA6="-A FORWARD -i eth1 -o eth0 -s 2804:1f38:2001:400::/56 -j DROP"
                REGRA_DEL="-D FORWARD -i eth1 -o eth0 -m iprange --src-range 172.16.3.2-172.16.3.254 -j DROP"
                REGRA6_DEL="-D FORWARD -i eth1 -o eth0 -s 2804:1f38:2001:400::/56 -j DROP"

                iptables-save | grep -- "$REGRA" > /dev/null

                if [ $? -ne 0 ]; then
                        iptables $REGRA
                        ip6tables $REGRA6
                        echo "LABORATÓRIO GENÉRICO 01 BLOQUEADO."
                else
                        iptables $REGRA_DEL
                        ip6tables $REGRA6_DEL
                        echo "LABORATÓRIO GENÉRICO 01 DESBLOQUEADO PARA INTERNET."
                fi
        ;;

esac
