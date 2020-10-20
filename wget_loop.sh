rm -rf 1* 
rm -rf *log
rm -rf 2*
#cd $DLOAD_LOC
run_wget() {
    i=1
    while [ 1 ]
    do
  #      for FILE in {1B,10B,100B,1K,2K,1M,2M,10M,20M,100M,200M,1G,2G}
        for FILE in {1B,1K,1M,10M,100M}
        do
            oldsum=$(grep -oP ".*(?=  $FILE)" /vms/test/md5sum.txt)
            wget  --no-check-certificate https://$1:$2/$FILE -O /vms/test/${FILE}_$2 > log_${2}.log 2>&1
            if [ $? != 0 ];then
                echo "FAILED [$(date)]: Iteration $i File ${FILE}_$2" | tee -a ${2}.log
                exit 1
            #else
            #    mdsum=$(md5sum ${FILE}_$2 | awk '{print $1}')
            #    if [[ "$mdsum" != "$oldsum" ]];then
            #        echo "FAILED [$(date)]: Iteration $i File ${FILE}_$2 ($oldsum $mdsum)" | tee -a ${2}.log
            #        exit 1
            #    else
            #        j=$(($i%1000))
            #        if [ $j == 0 ];then echo -n > ${2}.log
            #        fi
            #        echo "PASSED [$(date)]: Iteration $i File ${FILE}_$2 ($oldsum $mdsum)" >> ${2}.log
            #    fi
            fi
        done
	rm -rf *.log 1* 2*
        let i++
    done
    #if [ $(($i % 10)) -eq 0 ];then
#	    rm -rf 1B* 10B* 100B* 1K* 2K* 1M* 2M* 10M* 20M* 100M* 200M* 1G* 2G*
#    fi

}
for k in {10001..10050}
do
    run_wget 102.1.1.79 $k &
done
for k in {10101..10150}
do
    run_wget [1000::79] $k &
done
for k in {10051..10100}
do
    run_wget 102.2.2.79 $k &
done
for k in {10101..10200}
do
    run_wget [2000::79] $k &
done

