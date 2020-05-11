library(wordcloud2)
filename <-"portfolio"
words2 <- readLines("portfolio.txt")
words1 <- read.table(paste0("c:/HaleyDeveloper/Rstudy/",filename,".txt"),stringsAsFactors = F)
words1%>%
  count(V1)->words
my_cloud <- wordcloud2(words, size=0.5,col="random-light")
my_cloud
wordcloud2(words, figPath="실루엣.png", size=5)

library(htmltools)
my_path <- renderTags(my_cloud)


as.data.frame(words1)->words
library(dplyr)



library(devtools)
devtools::install_github("lchiffon/wordcloud2")
letter<-letterCloud(words,"R")
letterCloud(words, word = "R", size = 2)
letterCloud(data=words,word='O',wordSize=1)

library(htmltools)
my_path <- renderTags(my_cloud)
figPath =system.file("heart.png",package = "wordcloud2")

wordcloud2(words, figPath = "heart.png", size = 1.5,color = "skyblue")

word_data <- readLines("portfolio.txt")
word_data

word_data2 <- sapply(word_data, extractNoun, USE.NAMES = F)
word_data2

word_data3 <- extractNoun(word_data)
word_data3

