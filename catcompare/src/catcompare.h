#ifndef __CATCOMPARE_H__
#define __CATCOMPARE_H__

#include "catitem.h"
#include <string>

using namespace std;

class catcompare
{
public:
	catcompare(const string &, const string&);

public:
	vector<catitem> pitems;	// predicted items
	vector<catitem> titems;	// true items

private:
	int build_catitems(const string &file, vector<catitem> &items);

public:
	int compare();
	int print();
};

#endif
