install.packages("RSelenium")
library(RSelenium)

install.packages("sapply")
library(sapply)

url <- 'https://hotel.naver.com/hotels/item?hotelId=hotel:Shilla_Stay_Yeoksam&destination_kor=%EC%8B%A0%EB%9D%BC%EC%8A%A4%ED%85%8C%EC%9D%B4%20%EC%97%AD%EC%82%BC&rooms=2'
#body > div > div.ng-scope > div.container.ng-scope > div.content > div.hotel_article_review.ng-isolate-scope > div.paginate.ng-scope > a.direction.next.disabled

remDr <- remoteDriver(remoteServerAddr = "localhost",
                      port=4445, browserName="chrome")
remDr$open()

remDr$navigate(url)

endLink<-NULL
nextPage<-NULL
reple=NULL

repeat{
  doms <- remDr$findElements(using = "css selector", "div.review_ta.ng-scope > ul  div.review_desc > p")
  
  Sys.sleep(1)
  reple_vv<- sapply(doms, function(x){x$getElementText()})
  print(reple_vv)
  reple <- append(reple, unlist(reple_vv))
  
  if(!is.null(endLink)){
    break;
  }
  
  nextPage<-remDr$findElement(using='css', "body > div > div.ng-scope > div.container.ng-scope > div.content > div.hotel_used_review.ng-isolate-scope > div.review_ta.ng-scope > div.paginate > a.direction.next")
  nextPage$clickElement()
  try(endLink<-remDr$findElement(using='css', "body > div > div.ng-scope > div.container.ng-scope > div.content > div.hotel_article_review.ng-isolate-scope > div.paginate.ng-scope > a.direction.next.disabled"), silent=T)
  Sys.sleep(2)
}
View(reple)

setwd("C:/HaleyDeveloper/Rstudy")
getwd()
write.table(reple, "naverhotel.txt")

