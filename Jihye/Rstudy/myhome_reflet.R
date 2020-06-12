#다음과 같이 나의 집을 leafelt 으로 그려 본다.소스는 myhome_leaflet.R 로 그려진 결과는 mymap.html 로 제출한다.

library(stringr)
install.packages("ggmap")
library(ggmap)
register_google(key='AIzaSyD8k2DWC_7yFHCrH6LDR3RfITsmWMEqC8c')
myhome_latlong <- geocode(enc2utf8("6105 116th Ave NE Kirkland, WA 98033"), source = "google")


leaflet()

# 지도 배경에 타일깔기
leaflet() %>% addTiles() 

# 지도 배경에 센터 설정하기
map0 <- leaflet() %>% setView(lng = seoul_lonlat$lon, lat = seoul_lonlat$lat, zoom = 16)  
map0
map1 <- map0 %>% addTiles() 
map1

mh <- myhome_latlong
lon <- mh$lon
lat <- mh$lat
msg <- '<a>지혜의 집</a><hr>지나언니가 사는 곳'
map2 <- leaflet() %>% setView(lng = mh$lon, lat = mh$lat, zoom = 16) %>% addTiles() %>% 
  addCircles(lng = lon, lat = lat, color='pink', popup = msg )
map2

install.packages("htmlwidgets")
library(htmlwidgets)
saveWidget(map2, file="mymap.html")
