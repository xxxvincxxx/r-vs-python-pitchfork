## Project 

I like R. 
But most of companies work and require knowledge of python. Why? Everybody believes python is faster and more programmer-friendly. 
This might be true for pure python programming, but I believe in the contrary 


But the job of a data scientist encompasses three big areas:

* Data exploration
* Statistical Modeling
* Deployment

While I can see an advantage in using python for deployment (well, actually there is [Plumber](https://github.com/trestletech/plumber) for R), I am pretty sure that data exploration, visualization and modeling are much more enjoyable in R.

In this repository I want to replicate in R all the notebooks that [Nolan Conaway](https://github.com/nolanbconaway/pitchfork-data) has written in python and the benchmark the speed of each script on my local machine. 

There so much more I can do with dataset, especially in terms of clustering. 
This repository is currently a work-in-progress!!!

### Inspiration

* What should I listen to this today? 
* Do review scores for individual artists generally improve over time, or go down?
* How has Pitchfork's review genre selection changed over time?
* Who are the most highly rated artists? The least highly rated artists?

## Dataset

This dataset is provided as a `sqlite` database with the following tables: `artists`, `content`, `genres`, `labels`, `reviews`, `years`. 

For column-level information on specific tables, refer to the Metadata tab.

You can download the dataset from Kaggle via API using: 

``` bash
kaggle datasets download -d nolanbconaway/pitchfork-data
```

## Analyses

* [[Link](https://github.com/nolanbconaway/pitchfork-data/blob/master/notebooks/review-score-exploration.ipynb)]: An exploration of review scores.

There's a lot going on in this dataset. I replicated the notebook in R. The notebook took care of:
   + Score and Best New Music distributions
   + Ratings by Genre
   + Ratings by Author

Here the comparison of my script in R vs the script in Python on my machine.

In R:

```console
vincenzo@B-N-022:~./scripts$ time Rscript review_score.R
real	0m2.789s
user	0m2.485s
sys     0m0.088s
```


In Python: 

```console
vincenzo@B-N-022:~./scripts$ time python review_score.py
real	0m4.586s
user	0m2.051s
sys	 0m0.954s
```


The R script is apparently *faster*. Bear in mind that the python script prompts images via matplotlib `plt.show()` during the execution of the script. In any case ggplot2 does the same. So it is worth to investigate the issue (*does matplotplib comand `plt.show()` actually makes the exectution of the script slower?*)

* #### [[Link](https://github.com/xxxvincxxx/pitchfork-data/blob/master/notebooks/reviewer-development.ipynb)]: Reviewer development: do authors get tougher with experience?

The notebook analyses:
   + Get a sense of how many articles each person tends to write
   + Average score vs. Number of reviews per authors divided in 2 subsets (>70 reviews, <70 reviews)
   
Here the performance benchmarks:

In R:

```console
vincenzo@B-N-022:~./scripts$ time Rscript script_R.R 
── Attaching packages ─────────────────────────────────────── tidyverse 1.2.1 ──
✔ ggplot2 2.2.1     ✔ purrr   0.2.4
✔ tibble  1.4.2     ✔ dplyr   0.7.4
✔ tidyr   0.8.0     ✔ stringr 1.3.0
✔ readr   1.1.1     ✔ forcats 0.3.0
── Conflicts ────────────────────────────────────────── tidyverse_conflicts() ──
✖ dplyr::filter() masks stats::filter()
✖ dplyr::lag()    masks stats::lag()

real	0m2.542s
user	0m2.425s
sys     0m0.091s

```

In Python: 

```console
vincenzo@B-N-022:~./scripts$ time python script_py.py 
real	0m7.721s
user	0m2.625s
sys	 0m0.846s
```


Now, a caveat. In the python script, a for loop is used. R is infamously known for being kind of sucky at for loops. Bearing this in mind, I isolated the part of the scripts that contain the loop, and benchmarked them.

The `for loop` in R:

```console
vincenzo@B-N-022:~./scripts$ time Rscript script_loop_R.R 
real	0m1.151s
user	0m1.065s
sys	 0m0.071s
```
The `for loop` in Python:


```console
vincenzo@B-N-022:~./scripts$ time python script_loop_py.py 
real	0m0.578s
user	0m0.583s
sys	 0m0.302s
```

Python is 66.2811% faster! (wtf)

But let's not panic. What I need to do is avoid a `for loop` in base R and try:

* the apply family
* RC++
* foreach library

and then I will:
1. Benchmark these methods - in R - among them.
2. Benchmark the winner vs. the python script.

But not here, I will probably need to create another repository one day. But let's keep this conversation open here in order not to forget. 
