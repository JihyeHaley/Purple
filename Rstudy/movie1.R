install.packages("rvest") 
library(rvest)

url<- ("https://movie.daum.net/moviedb/grade?movieId=127122")


mv <- read_html(url)
mv
str(mv) #list

mv_star <- html_nodes(mv, ".emph_grade")
mv_star_2 <- html_text(mv_star)
mv_star_2


my_review <- html_nodes(mv, ".desc_review")
my_review2 <- html_text(my_review, trim=TRUE)


daummovie <- data.frame("point"=mv_star_2, "review"=my_review2)
write.csv(daummovie, file="daummovie.csv")
getwd()
