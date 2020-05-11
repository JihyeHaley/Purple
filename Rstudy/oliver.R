
library(wordcloud)
library(dplyr)
getwd()
oliver<-read.csv('oliver3.csv')

View(oliver)
oliver<-as.vector(oliver)
png("oliver.png", 600, 400)
oliver %>%
  Filter(function(x){nchar(x)>=2},.)%>%
  table %>%
  sort (decreasing=T)%>%
  data.frame ->oliver2

windwosFonts(kotic=windowsFont("고딕"))

wordcloud2(oliver, fontFamily = "맑은고딕")
wordcloud2(oliver,size=0.5,col="random-dark")
result<-wordcloud2(data = oliver, shape = 'star')
library("htmlwidgets")
saveWidget(oliver,"wc.html",title="WORDCLOUD2 실습", selfcontained = F)
head(yes2)
str(yes2)
install.packages('base64enc')
library(base64enc)
wordcloud2(oliver,size=0.5,col="random-dark", figPath="twitter.png")
dev.off()