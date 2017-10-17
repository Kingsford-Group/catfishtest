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
			continue
		l = len(line.split()) - 1
		if l in mydict:
			mydict[l] = mydict[l] + 1
		else:
			mydict[l] = 1

for k in mydict.keys():
	print k,mydict[k]
