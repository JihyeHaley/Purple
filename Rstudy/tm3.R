yes<-readLines('yes24.txt', encoding='ANSI')
View(yes)

yes %>%
  extractNoun %>%
  unlist %>%
  gsub("[[:punct:]]", "",.) %>%
  Filter(function(x){nchar(x)>=2},.)%>%
  table %>%
  sort (decreasing=T)%>%
  data.frame->yes2

View(yes2)

wordcloud2(yes2, fontFamily = "맑은고딕")
wordcloud2(yes2,size=0.5,col="random-dark")
result<-wordcloud2(data = yes2, shape = 'star')
library("htmlwidgets")
saveWidget(result,"wc.html",title="WORDCLOUD2 실습", selfcontained = F)
head(yes2)
str(yes2)
