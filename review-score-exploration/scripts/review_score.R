
packages <- c("tidyverse", "ggplot2", "RSQLite")

zzz<-lapply(packages, function(xxx) suppressMessages(require(xxx, character.only = TRUE,quietly=TRUE,warn.conflicts = FALSE)))
# connect to the sqlite file
con = dbConnect(SQLite(), dbname="/home/vincenzo/Documents/GitHub/r-vs-python-pitchfork/review-score-exploration/scripts/database.sqlite")# get a list of all tables
# get the populationtable as a data.frame
df_reviews = dbGetQuery( con,'SELECT * FROM reviews' )
df_genres = dbGetQuery( con,'SELECT * FROM genres' )
# Close connection
dbDisconnect(con)           

# mean and std of the score for best new music 
#df_reviews %>%
#    summarise(mean(score), mean(best_new_music), sd(score), sd(best_new_music))

df_reviews %>%
    mutate(score_factor = as.factor(score)) -> df_reviews

# plot frequency in ggplot for best_new_music vs. all reviews 
df_reviews %>%
    group_by(score_factor) %>%
    summarise(best_new_music = sum(best_new_music), all_review = n()) %>%
    gather(key=type, value = frequency, -score_factor) %>%
    ggplot(aes(x=score_factor, y=frequency, group = type)) + geom_line() + scale_x_discrete(labels = abbreviate)
    
df_reviews %>% 
    filter(best_new_music == 0 &  score == 10) -> df_review_top

df_reviews %>% 
    left_join(df_genres, by = "reviewid") %>%
    group_by(genre) %>%
    summarise(average_score = mean(score), count_reviews = n()) %>%
    drop_na() %>%
    ggplot(aes(count_reviews, average_score)) + geom_point() + geom_text(aes(label=genre),hjust=0, vjust=0) + 
    geom_smooth(method='loess', se = F) + 
    scale_y_continuous(limits = c(5,10))

df_reviews %>% 
    left_join(df_genres, by = "reviewid") %>%
    group_by(author) %>%
    summarise(avg_score = mean(score), count_review = n()) %>%
    filter(count_review > 15) %>%
    ggplot(aes(count_review, avg_score)) + geom_point()  + 
    geom_smooth(method='loess', se = F)