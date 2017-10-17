#!/bin/bash

bin=`pwd`
data=`pwd`/../data/rnaseq
results=`pwd`/../results/rnaseq.v0.2.1
scripts=`pwd`/scripts

rm -rf $scripts

for ss in `echo "human  mouse  salmon  zebrafish"`
do
	dir1=$data/$ss
	dir2=$results/$ss
	mkdir -p $dir2

	for k in `ls $dir1 | grep graph`
	do
		kk=${k/.graph/}

		echo "{ /usr/bin/time -v $bin/catfish -i $dir1/$k -o $dir2/$kk.full.out -a full > /dev/null; } 2> $dir2/$kk.full.time" >> $scripts
		echo "{ /usr/bin/time -v $bin/catfish -i $dir1/$k -o $dir2/$kk.greedy.out -a greedy > /dev/null; } 2> $dir2/$kk.greedy.time" >> $scripts
	done
done

nohup cat $scripts | xargs -L 1 -P 30 -I CMD bash -c CMD &
