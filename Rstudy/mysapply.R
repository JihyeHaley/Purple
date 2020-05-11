v<- sample(1:26, 10)

myff <- function(x){
  print(paste(x,"(",LETTERS[x],")"))
    r <- LETTERS[x]
}

result <- sapply(v, myff)
length(result)
result

write(result, 'mysapply.txt')
