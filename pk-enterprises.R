setwd("C:\\Users\\purna\\Desktop\\Coding\\R\\Datasets\\prithvi-krishna-enterprises")
wb = loadWorkbook("july-2019-purchase.xlsx")
entry = readWorksheet(wb, sheet = "Sheet1", header = TRUE)
supplier_list = unique(entry$Name)
#creating a matrix  with rows as suppliers and columns as purchases
supplier_purchases = matrix(ncol = 4, byrow = TRUE)
index = 0
for (i in supplier_list){
  index <- which(entry$Name==i, arr.ind = TRUE)
  addition = sum(entry[index,]$NetAmt)
  purchaseCount = length(index)
  average = addition/purchaseCount
  supplier_purchases = rbind(supplier_purchases, c(as.character(i),average, addition,  purchaseCount))
}
supplier_purchases = na.exclude(supplier_purchases)
colnames(supplier_purchases)= c("SupplierName", "AveragePurchases", "TotalAmount", "NumberofPurchases")

#writing supplier_purchases matrix into a csv file

write.csv(as.data.frame(supplier_purchases),file = "Extraction.csv")


