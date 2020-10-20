rm -rf res*
rm -rf iter_file.txt
i=0
while :
do

	Num_Client=`ps -ef | grep tsv | wc -l `
	echo $Num_Client
	if [ $Num_Client -eq 0 ]
	then
		i=`expr $i + 1`
		echo "Iteration:$i" >> iter_file.txt
		declare -a ports
		ports=(443 989 990 992 993 994 995 1364 4116 5349 6514 8531)
		for j in "${ports[@]}"
		do
			echo "Iteration: $i"
			env LD_LIBRARY_PATH=/usr/ktls/lib /opt/sonyhttpd/bin/ab -n 500 -c 1 -t 120 -g res1_$j.tsv https://1000::79:$j/1K & 
			env LD_LIBRARY_PATH=/usr/ktls/lib /opt/sonyhttpd/bin/ab -n 100 -c 1 -t 120 -g res2_$j.tsv https://1000::79:$j/1M   & 
			env LD_LIBRARY_PATH=/usr/ktls/lib /opt/sonyhttpd/bin/ab -n 500 -c 1 -t 120 -g res3_$j.tsv https://1000::79:$j/1G &
			env LD_LIBRARY_PATH=/usr/ktls/lib /opt/sonyhttpd/bin/ab -n 50 -c 2 -t 120 -g res4_$j.tsv https://1000::79:$j/2G  &
			env LD_LIBRARY_PATH=/usr/ktls/lib /opt/sonyhttpd/bin/ab -n 50 -c 2 -t 120 -g res5_$j.tsv https://2000::79:$j/1K  & 
			env LD_LIBRARY_PATH=/usr/ktls/lib /opt/sonyhttpd/bin/ab -n 500 -c 1 -t 120 -g res6_$j.tsv https://2000::79:$j/1M & 
			env LD_LIBRARY_PATH=/usr/ktls/lib /opt/sonyhttpd/bin/ab -n 500 -c 1 -t 120 -g res7_$j.tsv https://2000::79:$j/1G &
			env LD_LIBRARY_PATH=/usr/ktls/lib /opt/sonyhttpd/bin/ab -n 50 -c 2 -t 120 -g res8_$j.tsv https://2000::79:$j/2G &
			env LD_LIBRARY_PATH=/usr/ktls/lib /opt/sonyhttpd/bin/ab -n 500 -c 1 -t 120 -g res9_$j.tsv https://1000::79:$j/1K & 
			env LD_LIBRARY_PATH=/usr/ktls/lib /opt/sonyhttpd/bin/ab -n 100 -c 1 -t 120 -g res10_$j.tsv https://1000::79:$j/1M   & 
			env LD_LIBRARY_PATH=/usr/ktls/lib /opt/sonyhttpd/bin/ab -n 500 -c 1 -t 120 -g res11_$j.tsv https://1000::79:$j/1G &
			env LD_LIBRARY_PATH=/usr/ktls/lib /opt/sonyhttpd/bin/ab -n 50 -c 2 -t 120 -g res12_$j.tsv https://1000::79:$j/2G  &
			env LD_LIBRARY_PATH=/usr/ktls/lib /opt/sonyhttpd/bin/ab -n 50 -c 2 -t 120 -g res13_$j.tsv https://2000::79:$j/1K  & 
			env LD_LIBRARY_PATH=/usr/ktls/lib /opt/sonyhttpd/bin/ab -n 500 -c 1 -t 120 -g res14_$j.tsv https://2000::79:$j/1M & 
			env LD_LIBRARY_PATH=/usr/ktls/lib /opt/sonyhttpd/bin/ab -n 500 -c 1 -t 120 -g res15_$j.tsv https://2000::79:$j/1G &
			env LD_LIBRARY_PATH=/usr/ktls/lib /opt/sonyhttpd/bin/ab -n 50 -c 2 -t 120 -g res16_$j.tsv https://2000::79:$j/2G &
		done
	else
	sleep 10 
	fi
done

