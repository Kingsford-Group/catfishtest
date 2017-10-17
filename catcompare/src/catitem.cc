#include "catitem.h"
#include <set>

int catitem::add_path(const vector<int> &p)
{
	paths.push_back(p);
	return 0;
}

int catitem::compare(const catitem &ci)
{
	int x = 0;
	set<int> s;
	for(int i = 0; i < paths.size(); i++)
	{
		for(int j = 0; j < ci.paths.size(); j++)
		{
			if(s.find(j) != s.end()) continue;
			if(equal_path(paths[i], ci.paths[j]) == false) continue;
			s.insert(j);
			x++;
		}
	}

	printf("prediction %lu paths, true %lu paths, %d equal paths, %.2lf sensitivity, %.2lf precision, %s\n", 
			paths.size(), ci.paths.size(), x, x * 100.0 / paths.size(), x * 100.0 / ci.paths.size(), (x == ci.paths.size()) ? "TRUE" : "FALSE");
	return 0;
}

int catitem::clear()
{
	header = "";
	paths.clear();
	return 0;
}

int catitem::print()
{
	printf("%s\n", header.c_str());
	for(int k = 0; k < paths.size(); k++)
	{
		for(int i = 0; i < paths[k].size(); i++)
		{
			printf("%d ", paths[k][i]);
		}
		printf("\n");
	}
	return 0;
}

bool catitem::equal_path(const vector<int> &x, const vector<int> &y)
{
	if(x.size() != y.size()) return false;
	for(int k = 0; k < x.size(); k++)
	{
		if(x[k] != y[k]) return false;
	}
	return true;
}
