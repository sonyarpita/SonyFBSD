for ((i=1; i<=10; i++))
do
	echo "Iteration: $i"
	env LD_LIBRARY_PATH=/usr/ktls/lib ./ab -n 1 -c 1 -u 1K https://102.1.1.79/1K & 
	env LD_LIBRARY_PATH=/usr/ktls/lib ./ab -n 1 -c 1 -u 1M https://102.2.2.79/1M & 
	env LD_LIBRARY_PATH=/usr/ktls/lib ./ab -n 10 -c 5 -u 1G https://102.1.1.79/1G &
	env LD_LIBRARY_PATH=/usr/ktls/lib ./ab -n 50 -c 2 -u 1K https://102.2.2.79/1K & 
	env LD_LIBRARY_PATH=/usr/ktls/lib ./ab -n 10 -c 5 -u 1M https://102.1.1.79/1M & 
	env LD_LIBRARY_PATH=/usr/ktls/lib ./ab -n 1 -c 1 -u 1G https://102.2.2.79/1G 
done

