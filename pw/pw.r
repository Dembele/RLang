readinteger <- function()
{ 
  n <- readline(prompt="Enter an integer: ")
  if(!grepl("^[0-9]+$",n))
  {
    return(readinteger())
  }
  
  return(as.integer(n))
}

readdouble <- function()
{ 
  n <- readline(prompt="Enter a number: ")
  if(!grepl("^[0-9]+[.][0-9]+$",n))
  {
    return(readdouble())
  }
  
  return(as.double(n))
}

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
#fixed!
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
      names = c("setosa", "versicolor", "virginica")
      answer <- names[which.max(percentage)]
      if (is.nan(answer) || length(answer) == 0 )
        answer = "undef"
      cat(i,": ",percentage, " | \t", answer, "\n")
      return(answer)
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


#draws classMap for pw
#w - window width
#output - R graphics
printer<-function (w)
{
  colors <- c("setosa" = "red", "versicolor" = "green3",
              "virginica" = "blue", "undef" = "white")
  plot(iris[, 3:4], pch = 22, bg = colors[iris$Species], col =
         colors[iris$Species], asp = 1, axes=FALSE)
  
  for (i in (seq(0,3,0.1)))
  {
    for (j in (seq(0,8,0.1))){
      points(j,i,pch = 22, col = colors[pw(iris,j,i,w)], asp=1)
    }
  }
  
  legend(1,4,c("setosa","versicolor","virginica"),c("setosa" = "red", "versicolor" = "green3","virginica" = "blue"))
  title("PW Class map")
  axis(side = 1, at=c(0:8))
  axis(side = 2, at=c(0:3))
  box()
}

presentaion <- function()
{
  cat("Specify what you want:", "\n\t 1. pw", "\n\t 2. loo for pw", "\n\t 3. draw class map")
  answer <- readinteger()
  if (answer == 1)
  {
    cat("\nspecify point's x coordiate: ")
    x1 <- readinteger()
    cat("\nspecify point's y coordiate: ")
    x2 <- readinteger()
    cat("\nspecify window width: ")
    w <- readdouble()
    cat("\nanswer: ", pw(iris,x1,x2,w))
    break
  }
  if (answer == 2)
  {
    cat("\nspecify window width: ")
    w <- readdouble()
    cat("\nanswer: ", loo.pw(iris,w))
    break
  }
  if (answer == 3)
  {
    cat("\nspecify window width: ")
    w <- readdouble()
    cat("draw in progress... ")
    printer(w)
    cat("Done!")
  }
}