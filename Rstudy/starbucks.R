install.packages("RSelenium")
library(RSelenium)

remDr$open()
url<-'https://www.istarbucks.co.kr/store/store_map.do?disp=locale'
remDr$navigate(url)
Sys.sleep(3)

# 서울 클릭
clickSeoul <- remDr$findElement(using='css',"article > article:nth-child(4) ul > li:nth-child(1) > a")
clickSeoul$clickElement()
Sys.sleep(1)
# 전체 클릭
clickSeoul <- remDr$findElement(using='css',"#mCSB_2_container > ul > li:nth-child(1) > a")
clickSeoul$clickElement()
Sys.sleep(1)



sizeCss <- "#container > div > form > fieldset > div > section > article.find_store_cont > article > article:nth-child(4) > div.loca_step3 > div.result_num_wrap > span"
size <- remDr$findElements(using='css selector', sizeCss)
limit <- sapply(size, function(x){x$getElementText()})

limitCnt <- as.numeric(limit)
starbucks <- NULL


for(index in 1:limitCnt){
  # 하나의 매장의 매장 정보를 가져온다.
  selectInfo <- paste("#mCSB_3_container > ul > li:nth-child(",index,")", sep="")
  info <- remDr$findElement(using='css',selectInfo)
  infoTxt <- info$getElementText()
  infoArr <- strsplit(unlist(infoTxt), split="\n")
  infoArr<-infoArr[[1]][-4]
  
  lat <- info$getElementAttribute("data-lat")
  
  
  long <- info$getElementAttribute("data-long")
  
  
  infoArr<-append(infoArr, unlist(lat))
  infoArr<-append(infoArr, unlist(long))
  
  print(index)
  print(infoArr)
  starbucks <- cbind(starbucks, infoArr)
  
  # 3개씩 스크롤 내리기
  if(index %% 3 == 0 && index != limit)
    remDr$executeScript(
      "var dom = document.querySelectorAll('#mCSB_3_container > ul > li')[arguments[0]];
    dom.scrollIntoView();", list(index))
}
View(starbucks)
rownames(starbucks) <- c("Name","Addr","Call", "Latitude", "Longtitude")
colnames(starbucks)<- c(1:511)


name <- as.vector(starbucks[1,])
addr <- as.vector(starbucks[2,])
call <- as.vector(starbucks[3,])
latitude <- as.vector(starbucks[4,])
longtitude <- as.vector(starbucks[5,])

starbucks<- cbind(name, addr, call,latitude,longtitude)

getwd()
setwd("C:/HaleyDeveloper/Rstudy")
write.csv(starbucks, "starbucks1.csv")
