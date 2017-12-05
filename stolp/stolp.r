#unfinished

readinteger <- function()
{ 
  n <- readline(prompt="Enter an integer: ")
  if(!grepl("^[0-9]+$",n))
  {
    return(readinteger())
  }
  
  return(as.integer(n))
}

#compute distance between 2 points
distance <- function(x1, x2)
{
  return(sqrt(sum((x1 - x2) ^ 2)))
}

#stolp <- function(inputData, errorsMax, emission)
#{
#  dataMatrix <- matrix(data=NA, nrow=nrow(inputData), ncol=3)
#  distances <- matrix(data=NA, nrow=nrow(inputData), ncol=nrow(inputData))
#  for (i in 1:nrow(inputData))
#  {
#    dataMatrix[i,1] <- i
#    dataMatrix[i,3] <- inputData[i,5]
#    minEnemy <- Inf
#    minAlly <- Inf
#    for (j in 1:nrow(inputData))
#    {
#      if (inputData[i,5] == inputData[j,5])
#      {
#        if (minAlly > distance(x1=inputData[i,3:4], x2=inputData[j,3:4]))
#          minAlly <- distance(x1=inputData[i,3:4], x2=inputData[j,3:4])
#        else 
#        {
#          if (minEnemy > distance(x1=inputData[i,3:4], x2=inputData[j,3:4]))
#            minEnemy <- distance(x1=inputData[i,3:4], x2=inputData[j,3:4])
#        }
#        dataMatrix[i,2] <- minAlly / minEnemy
#      }
#    } 
#  }
#  cat("prep finished")
#  iteration <- 0
#  errors <- Inf
#  while (errors > errorsMax)
#  {
#    errors <- loo.knn(inputData, k=1)
#    cat("iteration: ", i, "\n")
#    
#   for(i in 1:nrow(dataMatrix))
#    {
#      if (dataMatrix[i,2] > emission) 
#     {
#        dataMatrix <- dataMatrix[-c(i),] 
#        inputData <- inputData[-c(i),]
#      }
#    }
#    minClass <- c(Inf,Inf,Inf)
#    minClassi <- c(NA,NA,NA)
#    for(i in 1:nrow(dataMatrix))
#    {
#      if (dataMatrix[i,2] < minClass[dataMatrix[i,3]])
#      {
#        minClass[dataMatrix[i,3]] <- dataMatrix[i,2]
 #       minClass[dataMatrix[i,3]] <- i
  #    }
   # }
#    cat("Errors: ", errors, "/", errorsMax, "\n")
 #   iteration <- iteration + 1
  #}
#return(inputData)
#}

#return class depending to distance to neighbors
#inputData - iris dataframe (or modify code a bit and pass any array or dataframe)
# x1, x2 - unknown point coordinates (prob should rename to x, y?)
#k - how many neigbors should algorithm search for
knn <- function (inputData, x1, x2, k)
{
  rows <- nrow(inputData)
  distances <- matrix(NA, nrow = rows, ncol = 2)
  for (i in 1:rows)
  {
    if (inputData[i, "Species"] == "setosa")
      distances[i, 1] <- 1
    else if (inputData[i, "Species"] == "versicolor")
      distances[i, 1] <- 2
    else
      distances[i, 1] <- 3
    distances[i, 2] <-
      distance(c(x1, x2), c(inputData[i, 3], inputData[i, 4]))
  }
  
  distances <- distances[order(distances[, 2]), ]
  near <- c()
  for (i in 1:k)
  {
    near[i] <- distances[i, 1]
  }
  t <- table(near)
  class <- names(t)[which.max(t)]
  if (class == 1)
    return("setosa")
  else if (class == 2)
    return("versicolor")
  else
    return("virginica")
}

STOLP <- function(inputData, delta, eps, metricFunction = distance)
{
  n <- dim(inputData)[2]-1
  l <- dim(inputData)[1]
  classesList <- unique(inputData[ ,n+1])
  len <- length(classesList)
  vvz <- NULL
  for(i in 1:len) { vvz[classesList[i]] <- i }
  mar <- rep(NA,len)
  j <- 0
  for(i in 1:l)
  {
    if(margin(inputData,i)>=delta)
    {
      j <- j+1
      inputData[j, ] <- inputData[i, ]
    }
  }
  l <- j
  for(i in 1:l)
  {
    tmp <- margin(inputData[1:l, ],i)
    tmp2 <- vvz[inputData[i,n+1]]
    
    if(is.na(mar[tmp2]) | mar[tmp2]<tmp)
    {
      mar[tmp2] <- tmp
      tmp <- inputData[tmp2, ]
      inputData[tmp2, ] <- inputData[i, ]
      inputData[i, ] <- tmp
    }
  }
  delta <- 0
  while(len!=l)
  {
    j <- 0
    mistakeObj <- NA
    for(i in (len+1):l)
    {
      if(knn(inputData[1:len, ],inputData[i,], 6)!=inputData[i,])
      {
        j <- j+1
        mistakeObj[j] <- i
      }
    }
    if(j<eps) break
    mar <- rep(NA,length(classesList))
    index <- rep(NA,length(classesList))
    for(i in mistakeObj)
    {
      tmp3 <- inputData[1:len, ]
      tmp3[len+1, ] <- inputData[i, ]
      tmp <- Margin(tmp3[1:(len+1), ],len+1)
      tmp2 <- vvz[inputData[i,n+1]]
      if(tmp<delta)
      {
        if(is.na(mar[tmp2]) | mar[tmp2]>tmp)
        {
          mar[tmp2] <- tmp
          index[tmp2] <- i
        }
      }
    }
    if(all(is.na(index))) { delta <- delta+1 }
    else { delta <- 0 }
    for(i in index)
    {
      if(!is.na(i))
      {
        len <- len+1
        tmp <- inputData[len, ]
        inputData[len, ] <- inputData[i, ]
        inputData[i, ] <- tmp
      }
    }
  }
  inputData[1:len, ]
}