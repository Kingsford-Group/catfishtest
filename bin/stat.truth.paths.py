#!/usr/bin/env python

import sys

if len(sys.argv) != 2:
	print 'usage:', 'truth file'
	sys.exit(0)

cnt = 0
mydict = {}
with open(sys.argv[1], 'r') as f:
	for line in f.readlines():
		if len(line) == 0:
			continue
		if line[0] == '#':
			if cnt <= 0:
				continue
			if cnt in mydict:
				mydict[cnt] = mydict[cnt] + 1
			else:
				mydict[cnt] = 1
			cnt = 0
		else:
			cnt = cnt + 1

for k in mydict.keys():
	if k == 1:
		continue
	print k,mydict[k]
