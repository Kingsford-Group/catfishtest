#include "catcompare.h"
#include <sstream>
#include <fstream>
#include <cassert>

catcompare::catcompare(const string &file1, const string &file2)
{
	build_catitems(file1, pitems);
	build_catitems(file2, titems);
}

int catcompare::build_catitems(const string &file, vector<catitem> &items)
{
	items.clear();
	ifstream fin(file);
	if(fin.fail()) return 0;

	string line;
	catitem ci;
	while(getline(fin, line))
	{
		if(line.size() == 0) continue;

		if(line[0] == '#')
		{
			if(ci.header != "") items.push_back(ci);		
			ci.clear();
			ci.header = line;
		}
		else
		{
			stringstream ss(line);	
			int k;
			vector<int> v;
			while(ss >> k) v.push_back(k);
			ci.add_path(v);
		}
	}

	return 0;
}

int catcompare::compare()
{
	assert(pitems.size() == titems.size());

	int pp = 0;
	int tt = 0;
	int xx = 0;
	int x1 = 0;
	int x2 = 0;
	for(int k = 0; k < pitems.size(); k++)
	{
		int p = pitems[k].paths.size();
		int t = titems[k].paths.size();
		int x = pitems[k].compare(titems[k]);

		printf("item %d: prediction %d paths, true %d paths, %d equal paths, %.3lf sensitivity, %.3lf precision, %s %s\n", 
			k, p, t, x, x * 100.0 / p, x * 100.0 / t, (p <= t) ? "TRUE1" : "FALSE1", (x >= t) ? "TRUE2" : "FALSE2");

		pp += p;
		tt += t;
		xx += x;

		if(p <= t) x1++;
		if(x >= t) x2++;
	}
	printf("summary: %lu instances, prediction %d paths, true %d paths, %d equal paths, %.3lf sensitivity, %.3lf precision, %.3lf ratio1, %.3lf ratio2\n", 
			pitems.size(), pp, tt, xx, xx * 100.0 / pp, xx * 100.0 / tt, x1 * 100.0 / pitems.size(), x2 * 100.0 / pitems.size());

	return 0;
}

int catcompare::print()
{
	printf("predicted items:\n");
	for(int i = 0; i < pitems.size(); i++) pitems[i].print();

	printf("true items:\n");
	for(int i = 0; i < titems.size(); i++) titems[i].print();

	return 0;
}
