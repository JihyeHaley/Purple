#문제9

iotest2 <- scan(file="data/iotest2.txt", what="")
#숫자가 아니라 캐릭터 파일이라서 default로 정해져있는 what을 제거한다
a<- table(iotest2)
cat("가장 많이 등장한 단어는", names(a[which.max(a)]), "입니다.")



top<-as.character(apply(data.frame(table(iotest2)), 2, max)[1])

?table
