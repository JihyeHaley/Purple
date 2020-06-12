url <- 'http://comic.naver.com/comment/comment.nhn?titleId=570503&no=135'

install.packages("RSelenium")
library(RSelenium)

remDr <- remoteDriver(remoteServerAddr = "localhost",
                      port=4445, browserName="chrome")
remDr$open()

remDr$navigate(url)

#베스트댓글 가져오기
bestReviewNodes<-remDr$findElements(using ="css selector","ul.u_cbox_list span.u_cbox_contents")
bestOne<- sapply(bestReviewNodes,function(x){x$getElementText()})

# 1페이지부터 10페이지까지 링크 클릭하여 페이지 이동하기 
#전체보기로 이동
totalReview <- remDr$findElement(using='css','#cbox_module > div > div.u_cbox_sort > div.u_cbox_sort_option > div > ul > li:nth-child(2) > a')
totalReview$clickElement()

#각 일의 자리 1
firstReview<-remDr$findElements(using ="css selector","ul.u_cbox_list span.u_cbox_contents")
lineOne<-sapply(firstReview,function(x){x$getElementText()})


#각 일의 자리 2 - 9
for (i in 4:13) {
  nextCss <- paste0("#cbox_module>div>div.u_cbox_paginate>div> a:nth-child(",i,") > span")
  nextPage<-remDr$findElement(using='css',nextCss)
  nextPage$clickElement()
  restReview<-remDr$findElements(using ="css selector","ul.u_cbox_list span.u_cbox_contents")
  sapply(restReview,function(x){x$getElementText()})
  #sapply(bestReviewNodes,function(x){x$getElementText()})
  Sys.sleep(2)
  if(i==13){
    nextpage<- '#cbox_module > div > div.u_cbox_paginate > div > a:nth-child(13)'
    nextpages<- remDr$findElement(using='css', nextpage)
    nextpages$clickElement()
  }
}

nextCss1<-remDr$findElement(using='css',"#cbox_module > div > div.u_cbox_paginate > div > strong")
nextCss1$getElementTagName()
nextCss1$getElementText()
nextCss1$clickElement() #CLICK EVENT 강제발생



#각 일의자리 2-9

sapply(nextPage,function(x){x$getElementText()})
sapply(nextPage,function(x){x$clickEelement()})
sapply(nextPage,function(x){x$getElementText()})
totalReviewNodes<-remDr$findElements(using ="css selector","ul.u_cbox_list span.u_cbox_contents")

