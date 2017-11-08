#compute distance between 2 points
distance <- function(x1, x2)
{
  return(sqrt(sum((x1 - x2) ^ 2)))
}

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

#leave one out for knn
#X - input dataframe
#k - parametr passed to knn
#returns errors quantity (natural value, not real one)
loo.knn <- function(inputData, k)
{
  rows <- nrow(inputData)
  errCnt = 0
  for (i in 1:rows)
  {
    ans <- knn(inputData[-i, ], inputData[i, 3], inputData[i, 4], k)
    if (ans != inputData[i, "Species"])
      errCnt = errCnt + 1
  }
  return(errCnt)
}
