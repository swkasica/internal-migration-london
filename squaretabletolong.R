#This function takes a square table where all the headings are repeated as rows
#And converts it into a table that can be used for network graphs
#For example, a table showing migration from one authority to another
#Where each authority appears both as a row (origin) and column (destination)
#For example data see https://github.com/BBC-Data-Unit/internal-migration-london
stot_all <- function(yourtable){
  #create empty vector, which will be filled and returned
  col1 <- c()
  headers <- colnames(yourtable[-1])
  colnum <- length(headers)
  #first loop
  for (i in c(1:colnum)){
    #second loop
    for (a in c(1:colnum)) {
      col1 <- c(col1, headers[a])
    }
  }
  col2 <- c()
  #first loop
  for (i in c(1:colnum)){
    #second loop
    for (a in c(1:colnum)) {
      col2 <- c(col2, headers[i])
    }
  }
  #convert to matrix
  yourmatrix <- as.matrix(yourtable[,-1])
  #create an array
  col3 <- array(yourmatrix)
  newtable <- data.frame(col1, col2, col3)
  return(newtable)
}