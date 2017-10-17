#!/bin/bash

bin=`pwd`/
data=`pwd`/../data/rnaseq

for ss in `echo "human  mouse  salmon  zebrafish"`
do
	./stat.truth.paths.py $data/$ss.truth > $data/$ss.paths
#./stat.truth.length.py $data/$ss.truth > $data/$ss.length
done
