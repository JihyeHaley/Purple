install.packages("rvest") 
library(rvest)

site<- ("https://movie.daum.net/moviedb/grade?movieId=131576&type=netizen&page=")
text <- NULL
movie.review <- NULL
for(i in 1: 20) {
  url <- paste(site, i, sep="")
  text <- read_html(url,  encoding="UTF-8")
  
  star <- html_nodes(text, ".emph_grade")
  stars<-html_text(star, trim=TRUE)
  
  review <- html_nodes(text, ".desc_review")
  reviews<-html_text(review, trim=TRUE)
  
  if(length(review) == 10) {
    page <- cbind(title, stars)
    page <- cbind(page, reviews)
    movie.review <- rbind(movie.review, page)
  } else {
    cat(paste(i," 페이지에는 리뷰글이 생략된 데이터가 있어서 수집하지 않습니다.ㅜㅜ\n"))
  }
}  
write.csv(movie.review, "daummovie2.csv")