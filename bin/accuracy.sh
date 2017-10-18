#!/bin/bash

if [ "$#" != "1" ]; then
	echo usage $0 folder
	exit
fi

tmpdir=`mktemp -d`
rm -rf $tmpdir/*

# group instances into 10 categories (starting from 2)
#cat $1/*.full.cmp | grep -v summary | awk '$7 == 1' > $tmpdir/full.1
cat $1/*.full.cmp | grep -v summary | awk '$7 == 2' > $tmpdir/full.2
cat $1/*.full.cmp | grep -v summary | awk '$7 == 3' > $tmpdir/full.3
cat $1/*.full.cmp | grep -v summary | awk '$7 == 4' > $tmpdir/full.4
cat $1/*.full.cmp | grep -v summary | awk '$7 == 5' > $tmpdir/full.5
cat $1/*.full.cmp | grep -v summary | awk '$7 == 6' > $tmpdir/full.6
cat $1/*.full.cmp | grep -v summary | awk '$7 == 7' > $tmpdir/full.7
cat $1/*.full.cmp | grep -v summary | awk '$7 == 8' > $tmpdir/full.8
cat $1/*.full.cmp | grep -v summary | awk '$7 == 9' > $tmpdir/full.9
cat $1/*.full.cmp | grep -v summary | awk '$7 ==10' > $tmpdir/full.10

#cat $1/*.greedy.cmp | grep -v summary | awk '$7 == 1' > $tmpdir/greedy.1
cat $1/*.greedy.cmp | grep -v summary | awk '$7 == 2' > $tmpdir/greedy.2
cat $1/*.greedy.cmp | grep -v summary | awk '$7 == 3' > $tmpdir/greedy.3
cat $1/*.greedy.cmp | grep -v summary | awk '$7 == 4' > $tmpdir/greedy.4
cat $1/*.greedy.cmp | grep -v summary | awk '$7 == 5' > $tmpdir/greedy.5
cat $1/*.greedy.cmp | grep -v summary | awk '$7 == 6' > $tmpdir/greedy.6
cat $1/*.greedy.cmp | grep -v summary | awk '$7 == 7' > $tmpdir/greedy.7
cat $1/*.greedy.cmp | grep -v summary | awk '$7 == 8' > $tmpdir/greedy.8
cat $1/*.greedy.cmp | grep -v summary | awk '$7 == 9' > $tmpdir/greedy.9
cat $1/*.greedy.cmp | grep -v summary | awk '$7 ==10' > $tmpdir/greedy.10

for k in `seq 2 10`
do
	file1=$tmpdir/full.$k
	file2=$tmpdir/greedy.$k

	# sensitivity and precision of paths for full algorithm
	a1=`cat $file1 | cut -f 4 -d " "`				# column of prediction paths
	b1=`cat $file1 | cut -f 7 -d " "`				# column of true paths
	c1=`cat $file1 | cut -f 9 -d " "`				# column of correct paths
	d1=`cat $file1 | grep TRUE1 | wc -l`			# (weak) correct instances
	l1=`cat $file1 | wc -l`							# number of instances
	p1=`echo $a1 | sed 's/ /+/g' | bc`				# number of predicted paths
	t1=`echo $b1 | sed 's/ /+/g' | bc`				# number of true paths
	x1=`echo $c1 | sed 's/ /+/g' | bc`				# number of correct paths

	u1=`echo "scale=4; 100.0 * $x1 / $p1" | bc`		# path sensitivity
	v1=`echo "scale=4; 100.0 * $x1 / $t1" | bc`		# path precision
	w1=`echo "scale=4; 100.0 * $d1 / $l1" | bc`		# instance accuracy
	z1=`echo "scale=4; 100.0 * $p1 / $t1" | bc`		# path ratio
	
	# sensitivity and precision of paths for greedy algorithm
	a2=`cat $file2 | cut -f 4 -d " "`				# column of prediction paths
	b2=`cat $file2 | cut -f 7 -d " "`				# column of true paths
	c2=`cat $file2 | cut -f 9 -d " "`				# column of correct paths
	d2=`cat $file2 | grep TRUE1 | wc -l`			# (weak) correct instances
	l2=`cat $file2 | wc -l`							# number of instances
	p2=`echo $a2 | sed 's/ /+/g' | bc`				# number of predicted paths
	t2=`echo $b2 | sed 's/ /+/g' | bc`				# number of true paths
	x2=`echo $c2 | sed 's/ /+/g' | bc`				# number of correct paths

	u2=`echo "scale=4; 100.0 * $x2 / $p2" | bc`		# path sensitivity
	v2=`echo "scale=4; 100.0 * $x2 / $t2" | bc`		# path precision
	w2=`echo "scale=4; 100.0 * $d2 / $l2" | bc`		# instance accuracy
	z2=`echo "scale=4; 100.0 * $p2 / $t2" | bc`		# path ratio
	
	echo $k $u1 $v1 $w1 $z1 $u2 $v2 $w2 $z2
done

rm -rf $tmpdir
