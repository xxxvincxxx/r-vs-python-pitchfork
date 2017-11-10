library(tidyverse)
library(RSQLite)

# connect to the sqlite file
con = dbConnect(SQLite(), dbname="/home/vincenzo/Documents/GitHub/r-vs-python-pitchfork/reviewer-development/scripts/data/database.sqlite")# get a list of all tables
# get the populationtable as a data.frame
df_reviews = dbGetQuery( con,'SELECT * FROM reviews' )
# Close connection
dbDisconnect(con)           

df_reviews %>%
    group_by(author) %>%
    summarise(n = n()) -> authors_count

x = seq(120)
y = 0
for (i in x){
    y[i] = sum(authors_count$n > i)}
