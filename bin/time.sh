#!/bin/bash

if [ "$#" != "1" ]; then
	echo "usge $0 folder"
	exit
fi

dir=$1

time1="0"
time2="0"
for k in `ls $dir | grep full.time`
do
	x1=`cat $dir/$k | grep User | grep time | awk '{print $4}'`
	x2=`cat $dir/$k | grep System | grep time | awk '{print $4}'`
	time1="$time1+$x1+$x2"
done

for k in `ls $dir | grep greedy.time`
do
	x1=`cat $dir/$k | grep User | grep time | awk '{print $4}'`
	x2=`cat $dir/$k | grep System | grep time | awk '{print $4}'`
	time2="$time2+$x1+$x2"
done
s1=`echo $time1 | bc`
s2=`echo $time2 | bc`

echo $s1 $s2
