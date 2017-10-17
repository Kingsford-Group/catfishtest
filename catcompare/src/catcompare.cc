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

	for(int k = 0; k < pitems.size(); k++)
	{
		printf("compare item %d: ", k);
		pitems[k].compare(titems[k]);
	}
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
