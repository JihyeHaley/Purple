
install.packages("rvest") 
library(rvest)

url<- ("http://unico2013.dothome.co.kr/crawling/exercise_bs.html")


exe <- read_html(url)
exe
str(exe) #list

#<h1> 태그의 컨텐츠
exe1 <- html_nodes(exe, "h1")
exe1_1 <- html_text(exe1)
exe1_1

#텍스트 형식으로 내용을 가지고 있는 <a> 태그의 컨텐츠와 herf 속성값
exe2 <- html_nodes(exe, "a")
exe2_1 <- html_text(exe2)
exe2_2 <- html_attr(exe2, "href")
exe2_2

#img태그의 src 속성값
exe3 <- html_nodes(exe, "img")
exe3_1<-html_attr(exe3, "src")
exe3_1


#첫번째 <h2> 태그의 컨텐츠
exe4 <- html_nodes(exe, "h2")
exe4_1 <- html_nodes(exe4, xpath="//h2[1]")
exe4_2 <- html_text(exe4_1)
exe4_2

#<ul> 태그의 자식 태그들 중 style 속성의 값이
#green 으로 끝나는 태그와 컨텐츠

exe5 <- html_nodes(exe, "ul")
exe5_1 <- html_nodes(exe, xpath="//ul/li[3]")
exe5_2 <- html_text(exe5_1)
exe5_2

#두번째 <h2> 태그의 컨텐츠
exe6 <- html_nodes(exe, "h2")
exe6_1 <- html_nodes(exe, xpath="//h2[2]")
exe6_2 <- html_text(exe6_1)
exe6_2

#<ul> 태그의 모든 자식 태그들의 컨첸츠
exe7 <- html_nodes(exe, "ol>*")
exe7_1 <- html_text(exe7)
exe7_1

#<table> 태그의 모든 자손 태그들의 컨텐츠
exe8 <- html_nodes(exe, "table *")
exe8_1 <- html_text(exe8)
exe8_1

#name이라는 클래스 속성을 갖는 <tr> 태그의 컨텐츠
exe9 <- html_nodes(exe, "table .name")
exe9_1 <- html_nodes(exe, "table>.name")
exe9_2 <- html_text(exe9)
exe9_2

#target이라는 아이디 속성을 갖는 <td> 태그의 컨텐츠
exe10 <- html_nodes(exe, "table #target")
exe10_1 <- html_nodes(exe, "table>#target")
exe10_2<- html_text(exe10)
exe10_2
