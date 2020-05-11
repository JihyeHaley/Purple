
library(wordcloud)
library(dplyr)

product<-readLines('공구.txt', encoding='UTF-8')
png("wc.png", 600, 400)
product %>%
  extractNoun %>%
  unlist %>%
  gsub("[^가-힣]", "",.) %>%
  gsub("세요", "",.)%>%
  gsub("필요해요", "",.) %>%
  gsub("원해","",.)%>%
  gsub("공구", "" ,.) %>%
  gsub("해주", "",.)%>%
  gsub("이요", "",.)%>%
  gsub("하나요", "",.)%>%
  gsub("부탁", "",.)%>%
  Filter(function(x){nchar(x)>=2},.)%>%
  table %>%
  sort (decreasing=T)%>%
  data.frame(stringAsFactors=F) ->product2

windwosFonts(kotic=windowsFont("고딕"))

wordcloud(product2$., product2$Freq, 
          min.freq=2,
          random.order=F,
          rot.per=0.4,
          sclae=c(5:0.8),
          random.color=T,
          colors=gray.colors(2),
          family="kotic")

dev.off()