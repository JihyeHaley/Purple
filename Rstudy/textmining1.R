lines <- readLines("data/memo.txt", encoding="UTF-8")
lines[1] <- gsub("[[:punct:]]","",lines[1])
lines[2] <- gsub("e", "E", lines[2])
lines[3] <- gsub("[0-9]","", lines[3])
lines[4] <- gsub("[[:upper:][:lower:]]", "", lines[4])
lines[4] <- gsub("  ", " ", lines[4])
lines[5] <- gsub("[[:digit:][:punct:]]", "", lines[5])
lines[6] <- gsub(" ","",lines[6])
lines[7] <- gsub("YOU","you",lines[7])
lines[7] <- gsub("OK","ok",lines[7])

getwd()
write(lines, file="memo_new.txt")

?gsub

?write