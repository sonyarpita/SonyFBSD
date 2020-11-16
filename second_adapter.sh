ifconfig cc2 103.1.1.77/24 up
ifconfig cc3 104.2.2.77/24 up
ifconfig cc2 inet6 3000::77 prefixlen 64
ifconfig cc3 inet6 4000::77 prefixlen 64
sysctl dev.t6nex.1.toe.tls=1
ifconfig cc2 toe
ifconfig cc3 toe
sysctl dev.t6nex.1.toe.tls_rx_ports="443 989 990 992 993 994 995 1364 4116 5349 6514 8531"

