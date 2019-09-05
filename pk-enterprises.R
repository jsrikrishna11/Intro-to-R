setwd("C:\\Users\\purna\\Desktop\\Coding\\R\\Datasets\\prithvi-krishna-enterprises")
wb = loadWorkbook("july-2019-purchase.xlsx")
entry = readWorksheet(wb, sheet = "Sheet1", header = TRUE)
suppliers = entry$Name

#frequency of each distributor by code
# library(ggplot2)
# library(ggpubr)
# theme_set(theme_pubr())
# qplot(as.numeric(suppliers), geom="histogram", binwidth= 1)
#average value of each purchase per supplier
supplier_list = unique(suppliers)
#creating a matrix  with rows as suppliers and columns as purchases
supplier_purchases = list()
for (i in supplier_list){
  index <- which(entry$Name==i, arr.ind = TRUE)
  addition = sum(entry[index,]$NetAmt)
  purchaseCount = length(index)
  average = addition/purchaseCount
  supplier_purchases[[i]] = c(average, addition,  purchaseCount)
}
#converting supplier_purchases list to dataframe

