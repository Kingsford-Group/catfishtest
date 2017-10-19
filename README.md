# Overview

This repository provides tools and scripts to evaluate
[**Catfish**](https://github.com/Kingsford-Group/catfish), which implements an efficient
heuristic for the minimum path flow decomposition problem.
Please refer to our pre-print at [bioRxiv](https://www.biorxiv.org/content/early/2016/11/16/087759).

# Datasets
We used two datasets to evaluate Catfish, namely **rnaseq** and **simulation**.
They are available at [CMU box](https://cmu.app.box.com/s/p687exyr279wny7fb2rb36wifvavvu3f).
The first dataset, **rnaseq**, contains four sets of perfect splice graphs with different species.
The second dataset, **simulation**, contains two sets of randomly simulated flow graphs with
different parameter settings. For both datasets, we provide input instances and ground truth 
decompositions.

We recommend downloading the data and uncompressed them in the folder of `data`, so
that the scripts in `bin` can be directly used.

# Catcompare
`catcompare` is a tool to evaluate the predictions of Catfish (or the greedy algorithm)
by comparing the decomposition of the algorithm with the ground truth decompositions.

We provide script to compile `catcompare` (requires `automake` package):
```
cd catcompare
./build.sh
```
This will also link the binary `catcompare` to `bin`.

The usage of `catcompare` is as follows:
```
catcompare <prediction> <ground-truth>
```
where the first parameter is the output of `catfish` (could be also the greedy algorithm
implemented within `catfish`) specified by `-o`. The second parameter is
the ground truth decompositions.

# Experiments

We provide scripts in `bin` to run and analysis the results for the two datasets.

