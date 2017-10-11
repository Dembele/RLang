knn <- function (L,W,k) {
  distances <- matrix(NA, nrow=150, ncol=2)
  for (i in 1:150){
    if (i<51) distances[i,1] <- 1
    else if (i<101) distances[i,1] <- 2
    else distances[i,1] <- 3
    distances[i,2] <- distance(c(L,W),c(iris[i,3], iris[i,4]))
  }
  distances <- distances[order(distances[,2]),]
  near <- c()
  for (i in 1:k)
  {
    near[i] <- distances[i,1]
  }
t <-table(near)
class <- names(t)[which.max(t)]
if (class==1) return "setosa"
if (class==2) return "versicolor"
if (class==3) return "verginika"
}
