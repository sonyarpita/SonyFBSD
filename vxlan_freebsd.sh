ifconfig vxlan0 destroy
ifconfig cc0 mtu 9000
route add -net 224/8 -interface cc0
sleep 1
echo "Creating vxlan interface using multicast group"
ifconfig vxlan create vxlanid 2023 vxlanlocal 102.1.1.77 vxlangroup 224.0.2.6 vxlandev cc0 inet 102.23.23.77/24
sleep 2
ifconfig vxlan0
netstat -nr

