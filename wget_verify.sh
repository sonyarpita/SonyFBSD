#!/bin/bash

DLOAD_LOC="/DATA"

cd $DLOAD_LOC

run_wget() {
    i=1
    while [ 1 ]
    do
#        for FILE in {1B,10B,100B,1K,2K,1M,2M,10M,20M,100M,200M,1G,2G}
        for FILE in {1B,1K,1M,10M,100M}
        do
            oldsum=$(grep -oP ".*(?=  $FILE)" md5sum.txt)
            wget -d -v --no-check-certificate https://$1:$2/DATA/$FILE -O /$DLOAD_LOC/${FILE}_$2 > log_${2}.txt 2>&1
	    if [ $? != 0 ];then
                echo "FAILED [$(date)]: Iteration $i File ${FILE}_$2" | tee -a ${2}.txt
                exit 1
            else
                mdsum=$(md5sum ${FILE}_$2 | awk '{print $1}')
	        if [[ "$mdsum" != "$oldsum" ]];then
	            echo "FAILED [$(date)]: Iteration $i File ${FILE}_$2 ($oldsum $mdsum)" | tee -a ${2}.txt
	            exit 1
	        else
	            j=$(($i%1000))
	            if [ $j == 0 ];then echo -n > ${2}.txt
                    fi
		    echo "PASSED [$(date)]: Iteration $i File ${FILE}_$2 ($oldsum $mdsum)" >> ${2}.txt
	        fi
            fi
        done
        let i++
    done
}

for k in {8001..8050}
do
    run_wget 102.11.11.11 $k &
done
for k in {8101..8150}
do
    run_wget [1000::11] $k &
done
for k in {9001..9050}
do
    run_wget 102.22.22.11 $k &
done
for k in {9101..9150}
do
    run_wget [2000::11] $k &
done

