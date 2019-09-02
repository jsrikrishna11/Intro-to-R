#matrix
score = c(44,5,2,9,81,32,24,58,19,0,6,23)
matByCol = matrix(score, nrow=4, byrow = TRUE)
matByRow = matrix(score, nrow = 4)
print("Printing by columns")
print(matByCol)
print("Printing by row")
print(matByRow)
mat=matByCol
#to find out number of rows
nrow(matByCol)
#to find out number of columns
ncol(matByCol)

#to find out number of dimensions
dim(matByCol)
print("Observe here that it gives in row x column order")

#access matrix elements
mat
#column one elements
mat[,1]
#third row element
mat[3,]
#column one row three element
mat[3,1]

#transpose of a matrix
matTranspose = t(mat)
matTranspose

#naming the rows and columns of a matrix
rowName = c("age", "sports index", "sports experience", "Chance of success")
colName = c("Radha krishna", "Sri Krishna", "JPC Rao")
rownames(mat)=rowName
colnames(mat)=colName
mat

#multiplying two matrices
matprod = matByCol%*%matTranspose
matprod

#arrays and pages in it
arr1 = array(c(1:9),dim = c(4,3,3,2))
arr1