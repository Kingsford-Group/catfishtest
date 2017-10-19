#!/bin/bash

# for simulation
dir1=`pwd`/../results/simulation.v0.2.1
dir2=`pwd`/../stats/simulation.v0.2.1
mkdir -p $dir2

file1=$dir2/param1.acc
file2=$dir2/param2.acc
time1=$dir2/param1.time
time2=$dir2/param2.time

rm -rf $file1
rm -rf $file2
rm -rf $time1
rm -rf $time2

for k in `seq 20 20 200`
do
	x1=`cat $dir1/param1/1000.$k.50.full.cmp | grep summary | cut -f 5,8,17 -d " "`
	x2=`cat $dir1/param1/1000.$k.50.greedy.cmp | grep summary | cut -f 5,8,17 -d " "`
	echo $k $x1 $x2 >> $file1
	tmpdir=`mktemp -d`
	ln -sf $dir1/param1/1000.$k.50.full.time $tmpdir/full.time
	ln -sf $dir1/param1/1000.$k.50.greedy.time $tmpdir/greedy.time
	x1=`./time.sh $tmpdir`
	echo $k $x1 >> $time1
done

for k in `seq 10 10 100`
do
	x1=`cat $dir1/param2/1000.100.$k.full.cmp | grep summary | cut -f 5,8,17 -d " "`
	x2=`cat $dir1/param2/1000.100.$k.greedy.cmp | grep summary | cut -f 5,8,17 -d " "`
	echo $k $x1 $x2 >> $file2

	tmpdir=`mktemp -d`
	ln -sf $dir1/param2/1000.100.$k.full.time $tmpdir/full.time
	ln -sf $dir1/param2/1000.100.$k.greedy.time $tmpdir/greedy.time
	x1=`./time.sh $tmpdir`
	echo $k $x1 >> $time2
done

