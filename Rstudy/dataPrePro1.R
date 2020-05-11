#문제 1 - R 언어로 내가 태오난 요일을 다음 형식으로 출력해 보자.
x<- 'Haley'
mybirth<-as.Date("1997-03-21")
myweekday<- format(mybirth, "%a")
paste(x, '는', myweekday,'요일에 태어났어요.', sep=' ')


#문제 2 - R 언어로 내가 태어난지 며칠이 지났는지 다음 형식으로 출력해 보자.
daysilive<-unclass(mybirth) 
yr<-format(today, "%Y")
mth<-format(today, "%m")
d<-format(today, "%d")
paste0('오늘은 ', yr,'년 ', mth, '월 ', d, '일 이고 내가 태어난지 ',daysilive,'일째되는 날이당' )


#문제 3 - 현재시간을 기준으로 년월일시분 정보를 출력해 보자.
today1<- format(today, "%Y년 %m월 %d일")
time<-Sys.time()
time<-gsub('KST','',time)
time<-gsub(Sys.Date() ,'',time)

hr<- substr(time,1,2)
hr<- paste0(hr,'시')
min<- substr(time,4,5)
min<- paste0(min,'분')
sec<- substr(time,7,8)
sec<- paste0(sec,'초')

paste(today1, hr,  min, sec)


#문제 4 - 텍스트 '12/25/2020 23:59:59', '1/25/2021 23:59:59', '2/25/2021 23:59:59'를 
#데이터프레임의 datetime 변수에 저장한 후 이를 날짜 형식(POSIXlt 객체)으로 
#변환한다.
View(datetime)
datetime<-data.frame('12/25/2020 23:59:59', '1/25/2021 23:59:59', '2/25/2021 23:59:59')
current<-NULL

for(i in 1:length(datetime)){
  current[i]<-substr(as.vector(datetime[1,i]),1,10)
  print(as.Date(current[i],format='%m/%d/%Y'))
}


#문제 5 - 2020년 6월 1일부터 7일간의 월, 일, 요일을 seq() 함수를 이용하여 생성하고 
#다음과 같은 형식으로 출력한다. 

start <- as.Date("2020-06-01")
end <- as.Date("2020-06-07")
sequse<-seq(start,end,1)
seqfun<-gsub('2020','',seq(start, end, 1))
seqfun<-gsub('-','',seqfun)

for(i in 1:length(seqfun)){
  as.vector(sequse)
  print(format(sequse[i], "%a"))
  weekdays[i]<-format(sequse[i], "%a")
}

paste0(weekdays, '-',seqfun)


#문제 6 -  'Happy', 'Birthday', 'to', You'로 
#           구성된 5텍스트 벡터 v1 생성한 후 벡터의 길이와
#           문자 개수의 합을 계산한다. 

sum<-0
v1<-c('Happy', 'Birthday', 'to', 'You')
for(i in 1:length(v1)){
  len<-nchar(v1[i])
  sum<-sum + len
}

num6<-sum+length(v1)
num6


#문제 7 - 6번 문제에서 생성한 텍스트 벡터 v1의 개별 
#원소들을 연결하여 다음과 같은 텍스트 벡터를 생성한다. 
#연결된 새로운 텍스트 벡터의 길이와 문자 개수의 합을 계산한다.
sentence<-NULL

v1<-as.vector(v1)

sentence<-paste(v1,collapse=" ")

num7<-nchar(sentence)+num6
num7


#문제 8 -  paste() 함수와 LETTERS 상수 벡터를 이용하여 다음과 같은 문자 벡터를 생성한다(첫 번째 벡터는 문자와 숫자 사이에 공백이 있으며, 두 번째 벡터는 문자와 숫자가 서로 붙어 있음).

num8_1 <- paste(LETTERS[1:10], c(1:10), sep=' ')
num8_2 <- paste(LETTERS[1:10], c(1:10), sep='')
num8_1; num8_2



#문제 9 - 텍스트 'Good Morning'을 분할하여 다음과 같은 리스트 형식으로 출력한다.

string <- 'Good Morning'
text <- c(unlist(strsplit(string," ")))
list(text[1],text[2])

#문제 10 -  다음 텍스트 벡터를 단어 단위로 분할한다. 단, 모든 쉼표(,)와 하이픈(-)을 제거한다.
	
word<-c("Yesterday is history, tommrrow is a mystery, today is a gift!", 
		"That's why we call it the present – from kung fu Panda")

word<-gsub(',','', word)
word<-gsub('–','', word)
word<-gsub('  ',' ', word)
word<-strsplit(x=word, split=" ")
word

#문제 11 -  다음 주민등록번호 세 개를 ssn 변수에 저장하고, 
#뒤 일곱 자리의 숫자를 '*******'으로 대체한다.

	
ssn<-c("941215-1234567", "850605-2345678", "760830-1357913")

ssn<-gsub("[[:digit:]]{7}",'*******',ssn)
ssn

#문제 12 -  다음 문자열을 s1 변수에 저장한 다음 요구 사항대로 처리한다.

s1<-'@^^@Have a nice day!! 좋은 하루!! 오늘도 100점 하루....'

#(1) 한글만 삭제하여 r1 에 저장 한다.
r1<-gsub("[가-힣]","", s1)
r1

#(2) 특수문자들을 삭제하여 r2 에 저장 한다.
r2<-gsub("[[:punct:]]","", s1)
r2
library(stringr)

str_replace_all(s1, "[[:punct:]]", "")

#(3) 한글과 특수문자들을 삭제하여 r3 에 저장 한다.

r3<-gsub("[가-힣[:punct:]]","", s1)
r3

#(4) 100을 '백'으로 변환하여 r4에 저장 한다.

 r4<-gsub('100',"백",s1)
r4      
