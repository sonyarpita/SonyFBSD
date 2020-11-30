#!/usr/local/bin/bash
myarray=($(screen -ls | awk '{print $1}'))
for i in "${myarray[@]}"
do
	screen -wipe $i
done 
screen -ls 
screen -r
