library<-read.csv('data/지역별장애인도서관정보.csv')
View(library)
library_add<-library[,c(5,2,9,10)]
View(library_add)
names(library_add)<- c("addr", "name", "lat", "long")

map_library <- get_map(location="seoul", zoom=11, maptype="roadmap")       
ggmap(map_library)+geom_point(data=library_add, aes(x=long, y=lat), alpha=0.5, size=5, color="blue")


librarymap<-ggmap(map_library) + 
  geom_point(data=library_add, aes(x=long, y=lat), alpha=0.5, size=5, color="blue") +
  geom_text(data=library_add,               
                       aes(x=long,y=lat),               
                       size=3,                
                       label=library_add$name,
                        vjust=2.3, hjust=0.5) + guides(color=F)

ggsave("library.png")
#서울 지도를 그리고 지역별 장애인 도서관 위치를 표시(투명한 point)한다. 도서관명을 함께 출력한다.

#소스는 library_map.R로 구현하고 출력 결과는 library.png 로 저장하여 제출한다.
