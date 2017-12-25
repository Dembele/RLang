Adaline <- function(objects = 200){
  sigma1 <- matrix(c(5, 0, 0, 1),2,2)
  sigma2 <- matrix(c(5, 0, 0, 1),2,2)
  mu1 <- c(0,0)
  mu2 <- c(0,7)
  x1 <- mvrnorm(n = objects, mu1, sigma1)
  x2 <- mvrnorm(n = objects, mu2, sigma2)
  
  xy1 <- cbind(x1, -1)
  xy2 <- cbind(x2, -1)
  xy1 <- cbind(xy1,1) 
  xy2 <- cbind(xy2,2) 
  
  xl <- rbind(xy1,xy2)
  l <- dim(xl)[1]
  colors <- c("red", "blue")
  
  print(min(xl[,2]))
 
  #Normalization
  xl[,1] <-  (xl[,1] - min(xl[,1]))/(max(xl[,1]) - min(xl[,1]))
  xl[,2] <-  (xl[,2] - min(xl[,2]))/(max(xl[,2]) - min(xl[,2]))
  plot(xl[,1],xl[,2], pch = 21,main = "ADALINE", xlab = 'rand feature 1', ylab= 'rand feature 2', col = colors[xl[,4]], asp = 1, bg=colors[xl[,4]])
  
  stochGrad(xl, 0.1, 0.5)
  points(xl[,1],xl[,2], pch = 21, col = colors[xl[,4]], bg=colors[xl[,4]], asp = 1)
}

loseFunction <- function(x){
  return ((1 - x)^2) 
}

getQ <- function(xl, w){
    new_classes <- xl[,4]
    for(i in 1 : dim(xl)[1]){
        if(new_classes[i] == 1){
            new_classes[i] = -1
        } else {
            new_classes[i] = 1
        }
    }
    res <- 0
    for(i in 1 : dim(xl)[1]){
        res <- res + (loseFunction(crossprod(xl[i,1:3],w) * new_classes[i]))
    }
    return(res)
}

stochGrad <- function(xl, teta, lamda){
      new_classes <- xl[,4]
      for(i in 1 : dim(xl)[1]){
        if(new_classes[i] == 1){
          new_classes[i] = -1
        } else {
          new_classes[i] = 1
        }
      }
      
     l <- dim(xl)[1]
     n <- dim(xl)[2]-1 
     w <- c();
     w <- runif(n, -1/(2*n), 1/(2*n))
     Q <- getQ(xl, w)
     Q_old <- Inf
     print(Q)
     cnt <- 0
     while(abs(Q_old - Q) > 0.00001){
       ind <- sample(1 : l, 1)
       x_rand <- xl[ind,]  
       eps <- (loseFunction(crossprod(x_rand[1:3],w) * new_classes[ind])) 
       w <- w - teta * (crossprod(x_rand[1:3],w) - new_classes[ind]) * x_rand[1:3]
       cnt <- cnt + 1
       Q_old <- Q
       Q <- (1 - lamda)*Q + lamda*eps
       cat("Conv diff on ", cnt, " iteration: ", abs(Q_old - Q), "\n")
       abline(w[3]/w[2],-w[1]/w[2], col = "black")
     }
     abline(w[3]/w[2],-w[1]/w[2], col="red", lwd = 3)
     legend(-0.5,1,c("class1","class2", "line of separation"),c("class1" = "red", "class2" = "blue", "line of separation" = "red"))
     cat("it took ", cnt, " iterations to converge \n")
}

