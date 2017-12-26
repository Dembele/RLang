naiveBayes <- function(xl, x, lambda, h)
{
  aprior_prob <- c()
  apost_prob <- c()
  prob <- c()
  classXl <- levels(xl$Species)
  n <- dim(xl)[2]-1

  for(y in 1:3)
  {
    sub_xl <- xl[xl$Species == classXl[y], ]
    m <- nrow(sub_xl)
    aprior_prob[y] <- m / dim(xl)[1]
    sum <- 0
    for(j in 1:m)
    {
      apost_value <- 1
      for(i in 1:n)
      {
        kerneRes <- 1/sqrt(2*pi)*exp(-1/2*((x[i] - sub_xl[j,i]) / h[i])^2) / h[i]
        apost_value <- apost_value * kerneRes
      }
      sum <- sum + apost_value
    }
    apost_prob[y] <- sum / m

    prob[y] <- log(lambda[y]*aprior_prob[y]) + log(apost_prob[y])
  }
  return(levels(xl$Species)[match(max(prob), prob)])
}