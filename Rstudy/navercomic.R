install.packages("rvest") 
library(rvest)

url <- "https://comic.naver.com/genre/bestChallenge.nhn"
text <- read_html(url)

comicName <- html_nodes(text, "#content table div.challengeInfo > h6 > a")
txtName <- html_text(comicName, trim=TRUE)

comicSummary <- html_nodes(text, "#content table div.challengeInfo > div.summary")
txtSummary <- html_text(comicSummary)

comicGrade <- html_nodes(text, "#content table div.rating_type > strong")
txtGrade <- html_text(comicGrade)

result <- data.frame("comicName"=txtName, "comicSummary"=txtSummary, "comicGrade"=txtGrade)

getwd()
setwd("C:/HaleyDeveloper/Rstudy")
write.csv(result, "navercomic.csv")
