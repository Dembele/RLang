#unfinished

#compute distance between 2 points
distance <- function(x1, x2)
{
  return(sqrt(sum((x1 - x2) ^ 2)))
}

stolp <- function(inputData, errorsMax, emission)
{
  dataMatrix <- matrix(data=NA, nrow=nrow(inputData), ncol=3)
  distances <- matrix(data=NA, nrow=nrow(inputData), ncol=nrow(inputData))
  for (i in 1:nrow(inputData))
  {
    dataMatrix[i,1] <- i
    dataMatrix[i,3] <- inputData[i,5]
    minEnemy <- Inf
    minAlly <- Inf
    for (j in 1:nrow(inputData))
    {
      if (inputData[i,5] == inputData[j,5])
      {
        if (minAlly > distance(x1=inputData[i,3:4], x2=inputData[j,3:4]))
          minAlly <- distance(x1=inputData[i,3:4], x2=inputData[j,3:4])
        else 
        {
          if (minEnemy > distance(x1=inputData[i,3:4], x2=inputData[j,3:4]))
            minEnemy <- distance(x1=inputData[i,3:4], x2=inputData[j,3:4])
        }
        dataMatrix[i,2] <- minAlly / minEnemy
      }
    } 
  }
  cat("prep finished")
  iteration <- 0
  errors <- Inf
  while (errors > errorsMax)
  {
    errors <- loo.knn(inputData, k=1)
    cat("iteration: ", i, "\n")
    
    for(i in 1:nrow(dataMatrix))
    {
      if (dataMatrix[i,2] > emission) 
      {
        dataMatrix <- dataMatrix[-c(i),] 
        inputData <- inputData[-c(i),]
      }
    }
    minClass <- c(Inf,Inf,Inf)
    minClassi <- c(NA,NA,NA)
    for(i in 1:nrow(dataMatrix))
    {
      if (dataMatrix[i,2] < minClass[dataMatrix[i,3]])
      {
        minClass[dataMatrix[i,3]] <- dataMatrix[i,2]
        minClass[dataMatrix[i,3]] <- i
      }
    }
    cat("Errors: ", errors, "/", errorsMax, "\n")
    iteration <- iteration + 1
  }
return(inputData)
}