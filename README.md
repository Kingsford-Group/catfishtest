# Overview

This repository provides tools and scripts to evaluate
[**catfish**](https://github.com/Kingsford-Group/catfish), which implements an efficient
heuristic for the minimum path flow decomposition problem.
Please refer to our [paper](https://doi.org/10.1109/TCBB.2017.2779509).

# Datasets
We used two datasets to evaluate `catfish`, namely **rnaseq** and **simulation**.
They are available at [zenodo](https://doi.org/10.5281/zenodo.1460998).
The first dataset, **rnaseq**, contains four sets of perfect splice graphs with different species.
The second dataset, **simulation**, contains two sets of randomly simulated flow graphs with
different parameter settings. For both datasets, we provide input instances and ground truth 
decompositions.

We recommend downloading the data and uncompressed them in the folder of `data`, so
that the scripts in `bin` can be directly used.

# Catcompare
We provide tool `catcompare` to evaluate the predictions of `catfish` (or the greedy algorithm)
by comparing the decomposition of the algorithm with the ground truth decompositions.

We provide script to compile `catcompare` (requires `automake` package):
```
cd catcompare
./build.sh
```
This will also link the binary `catcompare` to `bin`.

The usage of `catcompare` is as follows:
```
catcompare prediction ground-truth > algo.cmp
```
where the first parameter is the output of `catfish` (could be also the greedy algorithm
implemented within `catfish`) specified by `-o`. The second parameter is
the ground truth decompositions. 

# Experiments

We provide scripts in `bin` to run and analysis the results for the two datasets.
You need to link the binary `catfish` to `bin` before using these scripts.

1. `run.rnaseq.sh`: run `catfish` and the greedy algorithm on **rnaseq** dataset.
2. `run.simulate.sh`: run `catfish` and the greedy algorithm on **simulation** dataset.
3. `compare.rnase.sh`: compare the predictions of both methods with the ground truth decompositions for **rnaseq** dataset.
4. `compare.simulation.sh`: compare the predictions of both methods with the ground truth decompositions for **simulation** dataset.
5. `stat.rnaseq.sh`: collect results for the **rnaseq** dataset (used for Figures 10--13 and Table 1).
6. `stat.simulate.sh`: collect results for the **rnaseq** dataset (used for Table 2 and Table 3).
7. `stat.truth.sh`: collect statistics for ground-truth decompositions (used for Figure 8 and Figure 9).
