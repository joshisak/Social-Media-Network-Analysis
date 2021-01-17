
#install.packages("twitteR")


library(twitteR)
# Change the next four lines based on your own consumer_key, consume_secret, access_token, and access_secret. 

consumer_key <- "Qw1qwbCktYuQ5kNrfNY3dNZBp"
consumer_secret <- "NfKRseB2TiwK8pPdM0Rl8w5OgDKOgkAjJ9p7vghWagJMFlcoln"
access_token <- "452312788-xQP0RICW7QpJT4xbgAvhzADMvN2EGu7OiJjPT9Dp"
access_secret <- "lykbXFgAw5LOL04jOR7ev4emEI7PR1o9AHIgJULexPTK5"
setup_twitter_oauth(consumer_key, consumer_secret, access_token, access_secret)

##----- search tweets -----##

# Using the searchTwitter() function - "Donald Trump" return 500 tweets 30 days before election, resultType not specified so will be mix or top and recent results in output
tw1 = searchTwitter("Donald Trump", n = 750, since ="2020-10-02", until = "2020-11-02", lang = "en", retryOnRateLimit = 25)
d1 = twListToDF(tw1)
View(d1)

# Using the searchTwitter() function - "Donald Trump" return 500 tweets 30 days before election, resultType specified as popular
tw2 = searchTwitter("Donald Trump", n = 500, since ="2020-10-02", until = "2020-11-02", lang = "en", resultType = "popular", retryOnRateLimit = 750)
d2 = twListToDF(tw2)
View(d2)
## could only return 29 tweets for this time frame when "resultType=popular is specified)

# Using the searchTwitter() function - "Donald Trump" return 750 tweets August-Nov 2 before election, resultType not specified so will be mix or top and recent results in output
tw3 = searchTwitter("Donald Trump", n = 750, since ="2020-08-01", until = "2020-11-02", lang = "en", retryOnRateLimit = 25)
d3 = twListToDF(tw3)
View(d3)

# Using the searchTwitter() function - "Donald Trump" return top 50 tweets from Aug1-Nov2 - resultType specified as popular 
tw4 = searchTwitter("Donald Trump", n = 50, since ="2020-08-01", until = "2020-11-02", lang = "en", resultType = "popular", retryOnRateLimit = 25)
d4 = twListToDF(tw4)
View(d4)
#also could only return 29

# Noticed in d1 and d3 a lot of the tweets were retweets, so found a way to exclude retweets from results, trying again with same parameters as in d3 except 100 results without retweets
tw5 = searchTwitter("Donald Trump -filter:retweets", n = 100, since ="2020-08-01", until = "2020-11-02", lang = "en", retryOnRateLimit = 25)
d5 = twListToDF(tw5)
View(d5)

###############################################################################################################################################################################
###### -------------------------------------------------------------------------------------------------------------------------------------------------------------------#####
###############################################################################################################################################################################


#Save the dataframes to excel files 
library("writexl")
write_xlsx(d1,"C:\\Users\\Jenny's PC\\OneDrive\\Desktop\\d1.xlsx")

write_xlsx(d2,"C:\\Users\\Jenny's PC\\OneDrive\\Desktop\\d2.xlsx")

write_xlsx(d3,"C:\\Users\\Jenny's PC\\OneDrive\\Desktop\\d3.xlsx")

write_xlsx(d4,"C:\\Users\\Jenny's PC\\OneDrive\\Desktop\\d4.xlsx")

write_xlsx(d5,"C:\\Users\\Jenny's PC\\OneDrive\\Desktop\\d5.xlsx")


# new pull with different date range: since Oct-1-2020 of tweet mentions becuase previous outputs included a lot of tweets from nov1
tw6 = searchTwitter("Trump", n = 750, since ="2020-10-01", lang = "en", retryOnRateLimit = 100)
d6 = twListToDF(tw6)
View(d6)
write_xlsx(d6,"C:\\Users\\Jenny's PC\\OneDrive\\Desktop\\d6.xlsx")
