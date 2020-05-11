library(rvest)

url<-("http://media.daum.net/ranking/popular/")
text <- read_html(url)
text


nodes<- html_nodes(text, "#mArticle > div.rank_news > ul > li > div > strong > a")
title<- html_text(nodes, trim=TRUE);title

nodess<- html_nodes(text, "#mArticle > div.rank_news > ul > li > div > strong > span")
company<- html_text(nodess, trim=TRUE); company

page <- cbind(company, title)
page

