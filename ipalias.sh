for ((i=1; i<=100; i++))
do
	ifconfig cc0 103.$i.$i.85/24 alias
	ifconfig cc1 104.$i.$i.85/24 alias
done
