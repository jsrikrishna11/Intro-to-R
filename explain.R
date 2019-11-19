index = c(1:5)
maxnum = NULL
for(i in index){
  if(is.numeric(iris[,i])){
    maxnum=c(maxnum, max(iris[,i]))
  }
}
print(maxnum)

#for dataframe min and corresponding feature
col_names = colnames(iris[,1:4])

maxmin = data.frame(min)

rownames(maxmin) = rows
