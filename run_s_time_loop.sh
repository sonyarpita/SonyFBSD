rm -rf ouput
for ((i=10001; i<=10106; i++))
do
	echo $i >> output
	env LD_LIBRARY_PATH=/usr/ktls/lib /usr/ktls/bin/openssl s_time -connect 102.1.1.79:$i -www /1K -new -tls1_3 -time 12000 &>> output_$i &
done
for ((i=10107; i<=10212; i++))
do
	echo $i >> output
	env LD_LIBRARY_PATH=/usr/ktls/lib /usr/ktls/bin/openssl s_time -connect 102.2.2.79:$i -www /1K -new -tls1_3 -time 12000 &>> output_$i &
done
