for ((i=1; i<=50; i++))
do
	ifconfig cc0 103.$i.$i.77/24 alias
	ifconfig cc1 104.$i.$i.77/24 alias
done
