sysctl kern.ipc.mb_use_ext_pgs=1
sysctl kern.ipc.tls.enable=1
sysctl kern.ipc.tls.ifnet.permitted=1
kldload if_cxgbe
ifconfig cc0 102.1.1.77/24 up
sleep 1
ifconfig cc1 102.2.2.77/24 up
ifconfig cc0 inet6 1000::77 prefixlen 64
ifconfig cc1 inet6 2000::77 prefixlen 64
