#compute distance between 2 points
distance <- function(x1, x2)
{
  return(sqrt(sum((x1 - x2) ^ 2)))
}

#Parzen(?) window
#inputData - iris dataframe
#x1,x2 - unknown point
#h - window width
#returns class
#WARNING: floating bug i cant figgure out, somehow NA, NaN and 
#zero-lentgh pass through all if's i placed to catch errors
#WIP
pw <- function(inputData, x1, x2, h)
{
  rows = nrow(inputData)
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
  weight <- distances
  weight[, 2] <- NA
  summaryWeight <- c(0, 0, 0)
  
  for (i in 1:rows)
  {
    if (distances[i, 2] <= h)
    {
      weight[i, 2] <- 1 - distances[i, 2] / h
      summaryWeight[weight[i, 1]] <-
        summaryWeight[weight[i, 1]] + weight[i, 2]
    }
    else
    {
      allWeight = sum(summaryWeight)
      percentage <- c(
        summaryWeight[1] / allWeight * 100,
        summaryWeight[2] / allWeight * 100,
        summaryWeight[3] / allWeight * 100
      )
      print(percentage)
      names = c("setosa", "versicolor", "virginica")
      answer <- names[which.max(percentage)]
      if (length(answer) != 0 & !is.nan(answer))
        return(answer)
      else
        return(0)
    }
  }
}

#leave one out for par(Z?)en window
#h - window width
#returns error quantity
loo.pw <- function(inputData, h)
{
  rows <- nrow(inputData)
  errCnt = 0
  for (i in 1:rows)
  {
    ans <- pw(inputData[-i, ], inputData[i, 3], inputData[i, 4], h)
    if (length(ans) == 0 |
        ans != inputData[i, "Species"])
      errCnt = errCnt + 1
  }
  return(errCnt)
}