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

	for k in `ls $dir1 | grep truth`
	do
		kk=${k/.truth/}

		echo "$bin/catcompare $dir2/$kk.full.out $dir1/$k > $dir2/$kk.full.cmp" >> $scripts
		echo "$bin/catcompare $dir2/$kk.greedy.out $dir1/$k > $dir2/$kk.greedy.cmp" >> $scripts

	done
done

nohup cat $scripts | xargs -L 1 -P 30 -I CMD bash -c CMD &
