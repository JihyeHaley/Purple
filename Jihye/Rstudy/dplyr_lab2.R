getwd()
setwd('C:/HaleyDeveloper/Rstudy')


#1. 

install.packages("ggplot2") 
library(dplyr)
library(ggplot2)

str(ggplot2::mpg)
mpg<-as.data.frame(ggplot2::mpg)
View(mpg)


#1-1 mpg의 구조를 확인한다.
str(mpg)

#1-2 mpg 의 행의 개수와 열의 개수를 출력한다.
rowncol<-as.vector(dim(mpg))
paste0('행의 개수: ', rowncol[1])
paste0('열의 개수: ', rowncol[2])

nrow(mpg)
ncol(mpg)

#1-3 mpg의 데이터를 앞에서 10개 출력한다.
mpg %>%
  head(10)  

#1-4 mpg의 데이터를 뒤에서 10개 출력한다.
mpg %>%  
  tail(10) 

#1-5. mpg의 데이터를 GUI 환경으로 출력한다.
View(mpg)

#1-6 mpg를 열 단위로 요약한다.
mpg %>%
  group_by(manufacturer, model, displ, year, cyl, trans, drv, cty, hwy, fl, class) %>%          
  summarise(count = n())
  
#1-7 mpg 데이터셋에서 제조사별 차량의 수를 출력한다.
mpg%>%
  count(manufacturer)

#1-8 mpg 데이터셋에서 제조사별 그리고 모델별 차량의 수를 출력한다.
mpg%>%
  count(manufacturer, model)


#2-1.
#cty=도시연비
#hwy=고속도로 연비
mpg2<- rename(mpg,  city=cty, highway=hwy)

#2-2.


#3.ggplot2 패키지에는 미국 동북중부 
#437개 지역의 인구통계 정보를 담은 
#midwest라는 데이터가 포함되어 있습니다. 
#midwest 데이터를 
#사용해 데이터 분석 문제를 해결해보세요.
midwest

#3-1. ggplot2의 midwest 데이터를 데이터 프레임 형태로 
#불러와서 데이터의 특성을 파악하세요.
df<-data.frame(midwest)
View(df)

#3-2. poptotal(전체 인구)을 total로, 
#popasian(아시아 인구)을 
#asian으로 변수명을 수정하세요.

df <- rename(df, total=poptotal, asian=popasian)
View(df)

#3-3. total, asian 변수를 이용해 
#'전체 인구 대비 아시아 
#인구 백분율' 파생변수를 만들어 보세요

df %>% count(total) -> total
df %>% count(asian) -> asian
moved<-sum(total)/sum(asian)
typeof(moved) 

df %>% 
  mutate(moved = sum(total)/sum(asian))
#moved == asian 인구 백분율

#3-4.아시아 인구 백분율 
#전체 평균을 구하고, 평균을 초과하면 
#"large", 그 외에는 "small"을 
#부여하는 파생변수를 만들어 보세요.

df %>% 
  mutate(x = ifelse(asian >= moved, "large", "small"))

#4-1

mpg %>% 
  filter(displ<=4 & displ>=5) %>%
  group_by(displ) %>%
  summarise(mean_hwy = mean(hwy)) 
  
  
#4-2
mpg %>%
  filter(manufacturer =='audi' | manufacturer =='toyota') %>%
  group_by(manufacturer)%>%
  summarise(mean=mean(cty))

#4-3
mpg %>%
  filter(manufacturer =='chevrolet'| manufacturer =='ford' | manufacturer =='honda') %>%
  summarise(mean=mean(hwy))

#