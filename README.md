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
sys	 0m0.954s```


The R script is apparently *faster*. Bear in mind that the python script prompts images via matplotlib `plt.show()` during the execution of the script. In any case ggplot2 does the same. So it is worth to investigate the issue (*does matplotplib comand `plt.show()` actually makes the exectution of the script slower?*)

* #### [[Link](https://github.com/xxxvincxxx/pitchfork-data/blob/master/notebooks/reviewer-development.ipynb)]: Reviewer development: do authors get tougher with experience?

