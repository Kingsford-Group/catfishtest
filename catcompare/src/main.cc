/*
Part of catcompare
(c) 2017 by  Mingfu Shao, Carl Kingsford, and Carnegie Mellon University.
See LICENSE for licensing.
*/

#include "catcompare.h"

#include <cstdio>
#include <cstdlib>
#include <cstring>
#include <iostream>

using namespace std;

int main(int argc, const char **argv)
{
	if(argc != 3)
	{
		printf("usage: %s <predicted-paths> <true-paths>\n", argv[0]);
		return 0;
	}

	catcompare cc(argv[1], argv[2]);
	cc.compare();
	
	return 0;
}
