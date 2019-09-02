setwd("C:\\Users\\purna\\Desktop\\Coding\\R\\Datasets\\prithvi-krishna-enterprises")
wb = loadWorkbook("july-2019-purchase.xlsx")
df = readWorksheet(wb, sheet = "Sheet1", header = TRUE)
suppliers = df$Code

#frequency of each distributor by code
library(ggplot2)
library(ggpubr)
theme_set(theme_pubr())
qplot(as.numeric(suppliers), geom="histogram", binwidth= 1)
#average value of each purchase per supplier
