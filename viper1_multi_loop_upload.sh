rm -rf res*
rm -rf iter_file.txt
i=0
while :
do

	Num_Client=`ps -ef | grep tsv | wc -l `
	echo $Num_Client
	if [ $Num_Client -eq 1 ]
	then
		i=`expr $i + 1`
		echo "Iteration:$i" >> iter_file.txt
		declare -a ports
		ports=(443 989 990 992 993 994 995 1364 4116 5349 6514 8531)
		for j in "${ports[@]}"
		do
			echo "Iteration: $i"
			env LD_LIBRARY_PATH=/root/compiled-openssl-1.1.1-364/lib ./ab -n 5 -c 1 -u 1K   https://102.1.1.77:$j/1K & 
			env LD_LIBRARY_PATH=/root/compiled-openssl-1.1.1-364/lib ./ab -n 10 -c 1 -u 1M   https://102.1.1.77:$j/1M   & 
			env LD_LIBRARY_PATH=/root/compiled-openssl-1.1.1-364/lib ./ab -n 5 -c 1 -u 1G   https://102.1.1.77:$j/1G &
			env LD_LIBRARY_PATH=/root/compiled-openssl-1.1.1-364/lib ./ab -n 5 -c 2 -u 1K   https://102.1.1.77:$j/1K  &
			env LD_LIBRARY_PATH=/root/compiled-openssl-1.1.1-364/lib ./ab -n 5 -c 2 -u 1K   https://102.2.2.77:$j/1K  & 
			env LD_LIBRARY_PATH=/root/compiled-openssl-1.1.1-364/lib ./ab -n 5 -c 1 -u 1M   https://102.2.2.77:$j/1M & 
			env LD_LIBRARY_PATH=/root/compiled-openssl-1.1.1-364/lib ./ab -n 5 -c 1 -u 1G   https://102.2.2.77:$j/1G &
			env LD_LIBRARY_PATH=/root/compiled-openssl-1.1.1-364/lib ./ab -n 5 -c 2 -u 1K   https://102.2.2.77:$j/1K &
			env LD_LIBRARY_PATH=/root/compiled-openssl-1.1.1-364/lib ./ab -n 5 -c 1 -u 1K   https://102.1.1.77:$j/1K & 
			env LD_LIBRARY_PATH=/root/compiled-openssl-1.1.1-364/lib ./ab -n 10 -c 1 -u 1M   https://102.1.1.77:$j/1M   & 
			env LD_LIBRARY_PATH=/root/compiled-openssl-1.1.1-364/lib ./ab -n 5 -c 1 -u 1G   https://102.1.1.77:$j/1G &
			env LD_LIBRARY_PATH=/root/compiled-openssl-1.1.1-364/lib ./ab -n 5 -c 2 -u 1K   https://102.1.1.77:$j/1K  &
			env LD_LIBRARY_PATH=/root/compiled-openssl-1.1.1-364/lib ./ab -n 5 -c 2 -u 1K   https://102.2.2.77:$j/1K  & 
			env LD_LIBRARY_PATH=/root/compiled-openssl-1.1.1-364/lib ./ab -n 5 -c 1 -u 1M   https://102.2.2.77:$j/1M & 
			env LD_LIBRARY_PATH=/root/compiled-openssl-1.1.1-364/lib ./ab -n 5 -c 1 -u 1G   https://102.2.2.77:$j/1G &
			env LD_LIBRARY_PATH=/root/compiled-openssl-1.1.1-364/lib ./ab -n 5 -c 2 -u 1K   https://102.2.2.77:$j/1K &
		done
	else
	sleep 10 
	echo 1 > /proc/sys/vm/drop_caches
	echo 2 > /proc/sys/vm/drop_caches
	echo 3 > /proc/sys/vm/drop_caches
 
	fi
done

