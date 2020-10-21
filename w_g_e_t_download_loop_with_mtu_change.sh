ifconfig cc0 mtu 9600 up 
ifconfig cc1 mtu 9600 up
ssh 10.193.80.89 "ifconfig cc0 mtu 1500 up && ifconfig cc1 mtu 1500 up"
rm -rf iter_test_file
rm -rf *.log
run_wget() {
        for FILE in {1B,10B,100B,1K,2K,1M,2M,10M,20M,100K,200K}
        do
		wget --delete-after --no-check-certificate https://$1/$FILE &>> $1_$FILE.log &
        done

}
mtu=(88 256 512 576 808 1024 1280 1488 1500 2002 2048 4096 4352 8192 9000 9600)
i=0
while [ $i -lt 5001 ]
do
Num_Client=`ps -ef | grep wget | wc -l`
if [ $Num_Client -eq 0 ]
then
	i=`expr $i + 1`
	echo "Iteration: $i" >> iter_test_file
	rm -rf *.log
	if [ $((i % 10)) -eq 0 ]
	then
        		pos=`expr $(((i/10)%${#mtu[@]})) - 1`
        		echo "MTU on aqua6 == ${mtu[$pos]}" >> iter_test_file
			ssh 10.193.80.89 "ifconfig cc0 mtu ${mtu[$pos]} && ifconfig cc1 mtu ${mtu[$pos]}"
    		
	else
		echo "Value of i == $i Iteration is not divisible by 10" >> iter_test_file
	fi 
	for ((j=1; j<=75; j++))
        do
              	#run_wget 103.$j.$j.89
               	#run_wget 104.$j.$j.89
		run_wget [3000:$i::89]
		run_wget [4000:$i::89]
        done
else 
	sleep 20
fi 
#echo 1 > /proc/sys/vm/drop_caches
#echo 2 > /proc/sys/vm/drop_caches
#echo 3 > /proc/sys/vm/drop_caches
done
