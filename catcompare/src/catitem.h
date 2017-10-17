#ifndef __PITEM_H__
#define __PITEM_H__

#include <string>
#include <vector>

using namespace std;

class catitem
{
public:
	string header;
	vector< vector<int> > paths;

public:
	int add_path(const vector<int> &p);
	int compare(const catitem &ci);
	int clear();
	int print();
	bool equal_path(const vector<int> &x, const vector<int> &y);
};

#endif
