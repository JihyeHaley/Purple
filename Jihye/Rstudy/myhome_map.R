#우리 집의 지도를 출력하는데 
#현재의 초시간이 0~14초 사이이면 terrain 타입으로
#현재의 초시간이 15~29초 사이이면 satellite 타입으로
#현재의 초시간이 30~44초 사이이면 roadmap 타입으로
#현재의 초시간이 45~59초 사이이면 hybrid 타입으로
#지도를 출력하는 R 코드를 작성한다.
#지도 제목으로 "XXX 동네"를 설정하고 "위도"와 "경도"도 출력한다.
#파일명은 myhome_map.R 이고 지도는 이미지로 
#mymap.png 저장하여 함께 제출한다. 
Sys.time()
library(stringr)
install.packages("ggmap")
library(ggmap)
register_google(key='AIzaSyD8k2DWC_7yFHCrH6LDR3RfITsmWMEqC8c')

#시간
time1<-as.character(Sys.time())
time2<-as.vector(time1)
time2<-substr(time,nchar(time2)-1,nchar(time2))

myhome_latlong <- geocode(enc2utf8("6105 116th Ave NE Kirkland, WA 98033"), source = "google")
mh <- myhome_latlong
loc <- c(mh$lon, mh$lat)

if(time2>=0 & time2<=14){
  myhome_map <- get_googlemap(center=loc, maptype='terrain', zoom=16)
}else if(time2>15 & time2<=29){
  myhome_map <- get_googlemap(center=loc, maptype='satellite',zoom=16)
  
}else if(time2>=30 & time2<=44){
  myhome_map <- get_googlemap(center=loc, maptype='roadmap',zoom=16)
  
}else if(time2>=45 & time2<=59){
  myhome_map <- get_googlemap(center=loc, maptype='hybrid',zoom=16)
}

#지도 
myhome<-ggmap(myhome_map) + 
  geom_point(aes(x=mh$lon, y=mh$lat), alpha=0.4, size=5, color="pink") +
  geom_text(aes(x=mh$lon, y=mh$lat, label="지혜네집", vjust=1, hjust=-0.3))+
  labs(title='myhome', x='longtitute', y='latitutde')
myhome


ggsave("mymap.png")

