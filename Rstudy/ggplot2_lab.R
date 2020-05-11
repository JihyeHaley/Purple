library(MASS)
library(ggplot2)

#1.
ggplot(mpg, aes(x=cty, y=hwy)) + geom_point(shape=20, size=4, fill="blue") 


#2.
ggplot(mpg, aes(x=class)) + geom_bar(aes(fill=drv), alpha=1.0)


#3. 
View(midwest)
options(scipen=99)
ggplot(midwest, aes(x=poptotal, y=popasian))+ 
  geom_point(shape=20, size=3) +
  coord_cartesian(xlim = c(1, 500000), ylim = c(1,10000))

#4.

mpg%>% 
  filter(class=='compact'|class=='subcompact'|class=='suv')%>%
  group_by(class)%>%
  select(cty) -> mpg2

ggplot(mpg2, aes(x=class, y=cty))+ 
  geom_boxplot() 

#5.

product<-read.table(file='C:data/product_click.log', header=TRUE)
colnames(product)<-c('time', 'v2')

product%>%
  count(v2)->product2
colnames(product2)<- c('v2', 'count')

ggplot(product2, aes(x=v2, y=count)) + geom_bar(aes(fill=v2), stat='identity')

#6.
weekdays(tmp)
install.packages("dplyr")
library(stringr)
install.p
library(dplyr)

product3<-substr(product$time,1,8)
product3week<-as.Date(product3, "%Y%m%d")
product3weekdays<-weekdays(product3week)

product3 %>%
  mutate(day = product3weekdays)

product3<-as.vector(product3) 
product3 %>%
  substr(.,1,8)-> product3
?substr
View(product3)
