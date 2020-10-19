#Pass argument as roundrobin failover loadbalance broadcast lacp
ifconfig lagg0 create
ifconfig lagg0 up
ifconfig lagg0 laggproto $1 laggport cc0 laggport cc1
ifconfig lagg0 102.1.1.77/24 up
ifconfig lagg0 inet6 1000::77 prefixlen 64
