library(rvest)


url<-("http://www.saramin.co.kr/zf_user/search?search_area=main&search_done=y&search_optional_item=n&searchType=default_mysearch&searchword=Java")

text <- read_html(url)
text
nodes <- html_nodes(text,"#async_sfilter li label>.txt")
textx <- html_text(nodes)
textx<-textx[-31]

first<- gsub("[[:punct:]]", " ",nodes)

second <- gsbu("")
lines[5] <- gsub("[[:digit:][:punct:]]", "", lines[5])