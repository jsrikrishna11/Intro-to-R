setwd("C:\\Users\\purna\\Desktop\\Coding\\R\\Datasets\\crimes-in-boston")
crimeData <- read.csv("crime.csv")

#Histogram to describe frequency of crimes with respect to hour of occurence
hist(crimeData$HOUR, col="lightblue", freq = FALSE, xlab = "Hour of crime")

#prints the correlation between month and hour of crime
print(cor(crimeData$HOUR, crimeData$MONTH))

#frequency of crimes in each district
district<- crimeData$DISTRICT
library(ggplot2)
ggplot(data.frame(district), aes(x=district))
geom_bar()