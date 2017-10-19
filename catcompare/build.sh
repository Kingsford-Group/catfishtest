#!/bin/bash

aclocal
autoconf
autoheader
automake -a
./configure
make
ln -sf `pwd`/src/catcompare ../bin/catcompare
