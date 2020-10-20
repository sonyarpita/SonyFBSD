for ((i=1; i<=9000; i++))
do
	echo "Iteration: $i"
	env LD_LIBRARY_PATH=/usr/ktls/lib ./ab -n 500 -c 1 -t 120 -g res1.tsv https://102.1.1.79/1K & 
	env LD_LIBRARY_PATH=/usr/ktls/lib ./ab -n 1 -c 1 -t 120 -g res1.tsv https://102.1.1.79/1M   & 
	env LD_LIBRARY_PATH=/usr/ktls/lib ./ab -n 500 -c 1 -t 120 -g res1.tsv https://102.1.1.79/1G &
	env LD_LIBRARY_PATH=/usr/ktls/lib ./ab -n 50 -c 2 -t 120 -g res1.tsv https://102.1.1.79/2G  &
	env LD_LIBRARY_PATH=/usr/ktls/lib ./ab -n 50 -c 2 -t 120 -g res1.tsv https://102.2.2.79/1K  & 
	env LD_LIBRARY_PATH=/usr/ktls/lib ./ab -n 500 -c 1 -t 120 -g res1.tsv https://102.2.2.79/1M & 
	env LD_LIBRARY_PATH=/usr/ktls/lib ./ab -n 500 -c 1 -t 120 -g res1.tsv https://102.2.2.79/1G &
	env LD_LIBRARY_PATH=/usr/ktls/lib ./ab -n 50 -c 2 -t 120 -g res1.tsv https://102.2.2.79/2G 
done

