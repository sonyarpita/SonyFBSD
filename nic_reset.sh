kldload if_cxgbe
ifconfig cc0 102.1.1.77/24 up
sleep 1
ifconfig cc1 102.2.2.77/24 up
sleep 1 
ifconfig cc0 inet6 1000::77 prefixlen 64
sleep 1
ifconfig cc1 inet6 2000::77 prefixlen 64
sleep 1
devctl reset pci0:129:0:4
sleep 1 
sh /root/ip.sh
sleep 1
ping -c2 102.1.1.79 

dmesg 
