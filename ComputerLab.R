sweetness = as.vector(fruits$Sweetness)
ingredient = fruits[['Ingridient']]
crunchiness = fruits$Crunchiness

sweetcrunch =  cbind(crunchiness,sweetness)
scframe = data.frame(sweetcrunch)

lengthSweetness = length(sweetness)
rangeofSweetness = range(sweetness)

foodType = fruits$Foodtype 



icmatrix = as.matrix(cbind(ingredient,crunchiness))

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
value = sqldf("select ingridient, sweetness, foodtype from fruits ")

tomatoDF = data.frame("...1"= 11,"Ingridient"= "tomato","Sweetness"=6,"Crunchiness"=4,"Foodtype"= NA)
new = rbind(fruits,tomatoDF)

#distance between tomato to apple and green bean
distance <- function(x,y){
  return(sqrt((x[1]-y[1])^2+(x[2]-y[2])^2))
}

fruits = new
#get sweet and crunch of all items
distanceFrom = "tomato"
index= match(distanceFrom,fruits$Ingridient)
sweetnessOf = fruits$Sweetness[index]
crunchinessOf = fruits$Crunchiness[index]
arguments = c(sweetnessOf,crunchinessOf)
temp = fruits[which(fruits$Ingridient!="tomato"),c("Ingridient","Sweetness","Crunchiness")]
addColumn = vector()

#calculating distance of "tomato" from each point in the dataset
for(i in temp$Ingridient){
  clusterPoint = temp[which(temp$Ingridient==i),c("Sweetness","Crunchiness")]
  clusterPoint <- c(clusterPoint$Sweetness,clusterPoint$Crunchiness)
  addColumn = append(addColumn, distance(arguments, clusterPoint))
  print(i)
  print(clusterPoint)
}

tempWithDist = cbind(temp, "Distances" = addColumn)
tempWithDist[order(tempWithDist$Distances),]

#now we have a dataframe with each ingredient and its distance from tomato
tempWithDist = data.frame("FoodType"= fruits$Foodtype[1:10], "Distances"=tempWithDist$Distances) 

#now find the foodtype of "tomato"

tempWithDist = tempWithDist[order(tempWithDist$Distances),]
final = tempWithDist
kDist = final[1,]

vote = table(kDist$FoodType)
