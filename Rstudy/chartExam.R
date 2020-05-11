getwd()
setwd('C:/HaleyDeveloper/Rstudy')

#실습1
product<-read.table(file='C:data/product_click.log', header=TRUE)
product
View(product)
str(product)
product<-product[,-1]

product<-gsub("p001","1",product);product<-gsub("p002","2",product);product<-gsub("p003","3",product);
product<-gsub("p004","4",product);product<-gsub("p005","5",product);product<-gsub("p006","6",product);
product<-gsub("p007","7",product);product<-gsub("p008","8",product);
product<-gsub("p009","9",product);product<-gsub("p010","10",product)

product<-as.vector(product)
product<-as.numeric(product)

length(product)
View(p1)

p1<-0;p2<-0;p3<-0;p4<-0;p5<-0;p6<-0;p7<-0;p8<-0;p9<-0;p10<-0

for(i in 1:length(product)){
  if(product[i]==	'p001'){
    p1<- p1+1
  }else if(product[i]== 'p002'){
    p2<- p2+1
  }else if(product[i]== 'p003'){
    p3<- p3+1
  }else if(product[i]== 'p004'){
    p4<- p4+1
  }else if(product[i]== 'p005'){
    p5<-p5+1
  }else if(product[i]== 'p006'){
    p6<-p6+1 
  }else if(product[i]== 'p007'){
    p7<-p7+1
  }else if(product[i]== 'p008'){
    p8<-p8+1
  }else if(product[i]== 'p009'){
    p9<-p9+1
  }else if(product[i]=='p010'){
    p10<-p10+1
  }
}
xname=c('p001', 'p002','p003','p004','p005','p006','p007','p008','p009','p010')
product<-c(p1,p2,p3,p4,p5,p6,p7,p8,p9,p10)
png(filename="clicklog1.png", height=400, width=700, bg="white") # 출력을 png파일로 설정
barplot(product)
barplot(product, 
        main="세로바 그래프 실습", xlab="상품ID", ylab="클릭수",
    names.arg=xname, col=terrain.colors(10))
dev.off()


#실습2

getwd()
setwd('C:/HaleyDeveloper/Rstudy')
product2<-read.table(file='C:data/product_click.log', header=TRUE)
product2
View(product_time)

product_time<-product2[,-2]
product_time<-as.vector(product_time)
product_time<-as.numeric(product_time)
str(product_time)
head(product_time)

typeof(product_time)
install.packages("stringr")
library(stringr)
for(i in 1: length(product2))
product_time<-str_sub(product_time,-4,-3)

pp0<-0; pp1<-0; pp2<-0; pp3<-0; pp4<-0; pp5<-0;pp6<-0;pp7<-0;pp8<-0;pp9<-0
pp10<-0;pp11<-0;pp12<-0;pp13<-0;pp14<-0;pp15<-0;pp16<-0;pp17<-0;pp18<-0

for(i in 1:length(product_time)){
  if(product_time[i]==	00){
    pp0<- pp0+1
  }else if(product_time[i]== 01){
    pp1<- pp1+1
  }else if(product_time[i]== 02){
    pp2<- pp2+1
  }else if(product_time[i]== 03){
    pp3<- pp3+1
  }else if(product_time[i]== 04){
    pp4<- pp4+1
  }else if(product_time[i]== 05){
    pp5<- pp5+1 
  }else if(product_time[i]== 08){
    pp8<- pp8+1
  }else if(product_time[i]== 09){
    pp9<- pp9+1
  }else if(product_time[i]== 10){
    pp10<- pp10+1
  }else if(product_time[i]== 11){
    pp11<- pp11+1
  }else if(product_time[i]== 12){
    pp12<- pp12+1
  }else if(product_time[i]== 13){
    pp13<- pp13+1
  }else if(product_time[i]== 14){
    pp14<- pp14+1 
  }else if(product_time[i]== 15){
    pp15<- pp15+1
  }else if(product_time[i]== 16){
    pp16<- pp16+1
  }else if(product_time[i]==17){
    pp17<- pp17+1
  }else if(product_time[i]==18){
    pp18<- pp18+1
  }
}
product_time_result<-c(pp0,pp1,pp2,pp3,pp4,pp5,pp8,pp9,pp10,pp11,pp12,pp13,pp14,pp15,pp16,pp17,pp18)

png(filename="clicklog2.png", height=400, width=700, bg="white") # 출력을 png파일로 설정

pie(product_time_result,main="파이그래프 실습", labe=xname2, col=rainbow(18))
xname2=c('0~1','1~2','2~3','3~4','4~5','5~6','8~9','9~10','10~11', '11~12', '12~13', '13~14', '14~15','15~16','17~18','18~19')
dev.off()
