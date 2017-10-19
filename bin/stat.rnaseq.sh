#!/bin/bash

# for rnaseq
dir1=../results/rnaseq.v0.2.1
dir2=../stats/rnaseq.v0.2.1
mkdir -p $dir2

for k in `echo "human mouse salmon zebrafish"`
do
	nohup ./accuracy.sh $dir1/$k > $dir2/$k.acc &
	nohup ./time.sh $dir1/$k > $dir2/$k.time &
done
