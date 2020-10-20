for ((i=1; i<=50; i++))
do
	ping -c1 103.$i.$i.79
	ping -c1 104.$i.$i.79
done
