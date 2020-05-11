
library(httr)
library(rvest)
library(XML)
library(httr)
rm(list=ls())

#실습1번
searchUrl<- "https://openapi.naver.com/v1/search/blog.xml"
Client_ID <- "izGsqP2exeThwwEUVU3x"
Client_Secret <- "WrwbQ1l6ZI"

query <- URLencode(iconv("맛집","euc-kr","UTF-8"))
url <- paste0(searchUrl, "?query=", query, "&display=100")
food <- GET(url, add_headers
           ("Content_Type" = "application/xml",
             "X-Naver-client-Id" = Client_ID, 
             "X-naver-Client-Secret" = Client_Secret))

# 블로그 내용에 대한 리스트 만들기		
food2 <- htmlParse(food, encoding="UTF-8")
text<- xpathSApply(food2, "//item/description", xmlValue)
text
text <- gsub("</?b>", "", text)
text <- gsub("&.+t;", "", text)
naverBlog <- text

getwd()
setwd('C:/HaleyDeveloper/Rstudy')
write(naverBlog, "naverblog.txt")

#실습2번

install.packages("rtweet")
library(rtweet) 
appname <- "edu_data_collection"
api_key <- "RvnZeIl8ra88reu8fm23m0bST"
api_secret <- "wTRylK94GK2KmhZUnqXonDaIszwAsS6VPvpSsIo6EX5GQLtzQo"
access_token <- "959614462004117506-dkWyZaO8Bz3ZXh73rspWfc1sQz0EnDU"
access_token_secret <- "rxDWfg7uz1yXMTDwijz0x90yWhDAnmOM15R6IgC8kmtTe"
twitter_token <- create_token(
  app = appname,
  consumer_key = api_key,
  consumer_secret = api_secret,
  access_token = access_token,
  access_secret = access_token_secret)

key <- "취업"
key <- enc2utf8(key)
result <- search_tweets(key, n=500, token = twitter_token)
str(result)
result$retweet_text
content <- result$retweet_text
content <- gsub("[[:lower:][:upper:][:digit:][:punct:][:cntrl:]]", "", content)   
str(content)
content <- gsub("\n", "", content)   
content <- gsub("&lt;", "", content)
content <- gsub("단독", "", content)
content <- gsub("[a:Z]", "", content)
content<-na.omit(content)
View(content)

setwd('C:/HaleyDeveloper/Rstudy')
getwd()
write(content, "twitter.txt")


#실습3번
# 서울시 빅데이터- XML 응답 처리
# http://api.bus.go.kr/contents/sub02/getBusRouteList.html

library(XML)
API_key  <- "%2BjzsSyNtwmcqxUsGnflvs3rW2oceFvhHR8AFkM3ao%2Fw50hwHXgGyPVutXw04uAXvrkoWgkoScvvhlH7jgD4%2FRQ%3D%3D"
bus_No <- "360"
url <- paste("http://ws.bus.go.kr/api/rest/busRouteInfo/getBusRouteList?ServiceKey=", API_key, "&strSrch=", bus_No, sep="")
bus <- xmlParse(url, encoding="UTF-8")
top <- xmlRoot(bus)
top
df <- xmlToDataFrame(getNodeSet(bus, "//itemList"))
View(df)
str(df)
df<-df[-2,]

busRouteId <- as.vector(df$busRouteId)
buslength<- as.vector(df$length)
busend<- as.vector(df$stStationNm)
busstart<- as.vector(df$edStationNm)
busterm<- as.vector(df$term)

seoul360<-rbind(busRouteId,buslength,busend,busstart,busterm) 

View(seoul360)
write(seoul360, "bus2_nounit.txt")


#실습4번

library(jsonlite)
searchUrl<- "https://openapi.naver.com/v1/search/news.json"
Client_ID <- "izGsqP2exeThwwEUVU3x"
Client_Secret <- "WrwbQ1l6ZI"
query <- URLencode(iconv("빅데이터","euc-kr","UTF-8"))
url <- paste0(searchUrl, "?query=", query, "&display=100")
response <- GET(url, add_headers("Content_Type" = "application/json",
                                 "X-Naver-client-Id" = Client_ID, "X-naver-Client-Secret" = Client_Secret))

json_data <- content(response, type = 'text', encoding = "UTF-8")
json_obj <- fromJSON(json_data)
df <- data.frame(json_obj)
newText <- df[,5]
newText <- gsub("</?b>", "", newText)
newText <- gsub("&.+t;", "", newText)
newText
write(newText, "navernews.txt")


