import sqlite3
import pandas as pd
import numpy as np

con = sqlite3.connect('/home/vincenzo/Documents/GitHub/r-vs-python-pitchfork/reviewer-development/scripts/data/database.sqlite')
all_reviews = pd.read_sql('SELECT * FROM reviews', con)
con.close()

#First, I need to find the authors with a longer history (where distributional changes could be detected).
#Here's a barplot to get a sense of how many articles each person tends to write:
author_groups = all_reviews.groupby('author')
author_counts = author_groups.size().reset_index()

x = range(120)
y = [sum(author_counts[0] > i) for i in x]