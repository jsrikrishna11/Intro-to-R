sweetness = as.vector(fruits$Sweetness)
ingredient = fruits[['Ingridient']]
crunchiness = fruits$Crunchiness

sweetcrunch =  cbind(crunchiness,sweetness)
scframe = data.frame(sweetcrunch)

lengthSweetness = length(sweetness)
rangeofSweetness = range(sweetness)

foodType = fruits$Foodtype 

elements = c(1,4,8)

icmatrix = cbind(ingredient,crunchiness)

#find crunchiness of grape
index = icmatrix[,"ingredient"]=="grape"
index = match(TRUE, index)
crunchy_grape = icmatrix[index, "crunchiness"]

#find sweetness and crunchiness of all ingredients
ISCmatrix = cbind(ingredient, sweetness, crunchiness)
print(ISCmatrix)

#find sweetness and crunchiness for carrots to nuts
index = ISCmatrix[,"ingredient"] == "carrot"
upper = match(TRUE, index)
index = ISCmatrix[,"ingredient"] == "nuts"
lower = match(TRUE, index)

for(i in c(upper,lower)){
  print(ISCmatrix[i,])
}

#dimensions of dataframe
dim.data.frame(fruits)

#print data corresponding to carrot
library(sqldf)
df = sqldf("select * from fruits where ingridient='carrot'")

#create dataframe containing crunchiness data of all ingredients 
sqldf("select ingridient, crunchiness from fruits ")

#create dataframe containing only sweetness and foodtype for all ingredients
sqldf("select ingridient, sweetness, foodtype from fruits ")

#