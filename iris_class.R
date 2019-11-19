mins = NULL
notfactor = 1
notfactors = NULL
for(i in colnames(leaves)){
  if(!is.factor(leaves[,i])){
    notfactors = c(notfactors, notfactor)
    mins = c(mins, min(leaves[,i]))
  }
  notfactor = notfactor + 1
}

#dataframe with mins and rowname
MinMaxData = matrix(mins, byrow = TRUE,ncol = length(mins))

max=NULL
for(i in colnames(leaves)){
  if(!is.factor(leaves[,i])){
    max = c(max, max(leaves[,i]))
  }
}

MinMaxData = rbind(MinMaxData, max)

colnames(MinMaxData) <- colnames(leaves)[notfactors]

dfMinMax = as.data.frame(MinMaxData)
#take species and operation as input and return the result of 
#operation
operation <- function( op, species){
  #set = leaves make it compatible with your usecase
  switch(op,
      "mean" = return(mean(df[which])),
      "min" = return(min(df)),
      "mean" = return(mean(df)),
      "median" = return(median(df))
         )
}


#	20. Define a function which takes the inputs as leaves and a 
#species names to returns the values corresponding to mean of 
#all the features.

means <- function(species){
  df = leaves[leaves$Species==species, notfactors]
  means = c()
  cols = colnames(df)
  for(i in cols){
    means = c(means, mean(df[,i]))
  }
  m=data.frame(means)
  return(t.data.frame(m))
}

