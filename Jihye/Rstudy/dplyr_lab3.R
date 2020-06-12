#7.1
library(dplyr)
library(ggplot2)
mpg2<-mpg
mpg2<-mpg2 %>%
  mutate(sumCtyHwy= cty+hwy)
View(mpg2)

#7.2

mpg2<-mpg2 %>% 
  mutate(meanCtyHwy =sumCtyHwy/2)

#7.3
mpg2%>%
  arrange(desc(meanCtyHwy)) %>% 
  head(3)


#7.4
mpg %>%
  mutate(sumCtyHwy= cty+hwy) %>%
  mutate(meanCtyHwy =sumCtyHwy/2)%>%
  arrange(desc(meanCtyHwy)) %>% 
  head(3)



#8.1
mpg %>%
  group_by(class)%>%
  count(class)

#8.2
mpg %>%
  group_by(class)%>%
  summarise(mean_cty=mean(cty))%>%
  arrange(desc(mean_cty))        

#8.3
mpg %>%
  group_by(class)%>%
  summarise(mean_hwy=mean(hwy))%>%
  arrange(desc(mean_hwy))
  head(3)
  
#8.4
  
mpg %>%
  group_by(manufacturer) %>%
  filter(class=='compact') %>%
  count %>%
  arrange(desc(n))


#9.1
fuel <- data.frame(fl=c("c", "d", "e", "p", "r"),
                   price_fl=c(2.35, 2.38, 2.11, 2.76, 2.22),
                   stringsAsFactors=F)


mpg<- full_join(mpg, fuel, by='fl')



#9.2
View(mpg%>% 
  arrange(desc(price_fl))%>%
  head(5))

#10.1
#10.2
#10.3
#10.4

#11.1
#11.2

#12.1
#12.2