#문제8
getwd()
setwd("C:/HaleyDeveloper/Rstudy")
iotest1 <- scan("data/iotest1.txt")
sort.iotest1 <- sort(iotest1)
rev.iotest1 <- rev(sort.iotest1)
sum.iotest1 <- sum(iotest1)
avg.iotest1 <- mean(iotest1)

iotest11 <-cat("오름차순: ", sort.iotest1, "\n", "내림차순: ", rev.iotest1, "\n","합: ", sum.iotest, "\n","평균: ", avg.iotest, "\n")
save(iotest11,file="test1.rda") # varience will save in "all.rda" of rexam
