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

* Do review scores for individual artists generally improve over time, or go down?
* How has Pitchfork's review genre selection changed over time?
* Who are the most highly rated artists? The least highly rated artists?

## Dataset

This dataset is provided as a `sqlite` database with the following tables: `artists`, `content`, `genres`, `labels`, `reviews`, `years`. 

For column-level information on specific tables, refer to the Metadata tab.




## Analyses

* [[Link](https://github.com/nolanbconaway/pitchfork-data/blob/master/notebooks/review-score-exploration.ipynb)]: Exploring user reviews