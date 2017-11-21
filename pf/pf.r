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

#wieght closest neihbor
#inputData=Iris dataframe
#x1, x2 - some point
#weights - array of weights for iris frame
#h - window radius
#RETURN distance closest to this point from already known points
wcn <- function (inputData, x1, x2, weights, h) {
  rows <- nrow(inputData)
  distances <- matrix(data = 0, nrow = rows, ncol = 2)
  distances[,1] <- inputData[,5]
  for (i in 1:rows)
  {
    
    distances[i, 2] <-
      weights[i] * (1/(distance(c(x1, x2), c(inputData[i, 3], inputData[i, 4]))/h+1))
  }
  
  distances <- distances[order(distances[, 2],decreasing=1), ]
  return(distances[1,1])
}

#potential functions
#inputData=Iris dataframe
#errCnt - max errors (you can call it precision)
#h - window radius for wieght closest neihbor function
#RETURN array of potencials
pf.knn <- function(inputData, errCnt, h)
{
  gammain <- c()
  classes <- c()
  startTime <- Sys.time()
  for (i in 1:nrow(inputData))
  {
    gammain <- c(gammain,0)
    if (inputData[i, "Species"] == "setosa")
      classes[i] <- 1
    else if (inputData[i, "Species"] == "versicolor")
      classes[i] <- 2
    else
      classes[i] <- 3
  }
  
  iteration <- 0
  errors <- nrow(inputData)
  cat(classes)
  while (errors > errCnt)
  {
    errors = 0
    for (i in 1:nrow(inputData))
    {
      checker <- wcn(inputData, iris[i,3], iris[i,4], gammain, h)
      
      if (checker == classes[i]){}
      else
      {
        gammain[i] <- gammain[i] + 1
        errors = errors + 1
      }
    }
    cat("\niteration: ", iteration, " ", errors, "/", errCnt, "\n")
    iteration = iteration + 1
  }
  print(Sys.time() - startTime)
  return(gammain)
}