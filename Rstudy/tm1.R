#1

hotel <- readLines('hotel.txt')

#hotel2<- sapply(hotel, extractNoun, USE, NAMES=F)
hotel2 <- extractNoun(hotel)

hotel2 <- unlist(hotel2)

hotel2<- gsub("[^가-힇]", "", hotel2) #한글이 아닌거 부터 삭제하고 

hotel2 <- Filter(function(x) {nchar(x) >= 2}, hotel2) 

hotel2 <- table(hotel2)

result <- sort(hotel2, decreasing = T)

head(result, 10)

df<- data.frame(result)

write.csv(df,"hotel_top_word.csv")
getwd()

#워드 클라우드로 표현
library(dplyr)
word_data <- readLines('hotel.txt')
word_data %>%
  gsub("^[가-힣]", "",.) %>%
  extractNoun %>%
  unlist %>%
  table %>%
  sort (decreasing=T)%>%
  head(10) %>%
  data.frame %>%
  write.csv("hotel_top_word.csv")
