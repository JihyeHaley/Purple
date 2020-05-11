library(dplyr)

mpg
#1
cty<-mpg %>%
  select(cty)
cty<-as.vector(cty)

hwy<-mpg%>%
  select(hwy)
View(content)
hwy<-as.vector(hwy)

content<-data.frame(cbind(cty, hwy))

#산점도 그리기
plot(formula=hwy~cty, data=content, pch=3, xlab='도시연비',ylab='고속도로연비')



#2

drv<-mpg %>%
  group_by(drv)%>%
  count
View(drv)

xname<-drv$drv
drv<-as.matrix(drv)

barplot(drv$n, names.arg=xname, col=rainbow(3))

barplot(table(mpg$crv), col= rainbow(3))

#3
boxplot(mpg$hwy~mpg$manufacture, data=mpg, las=2, ylab="고속연비", xlab="제조")
