distance <- function(L, W)
+ {
+     return(sqrt(sum((L-W)^2)))
+ }
> classy <- function(x,y){
+     point <- distance(x, y)
+     setosaL <- mean(iris[1:50,3])
+     setosaW <- mean(iris[1:50,4])
+     setosa <- distance(setosaL, setosaW)
+     versicolor <- distance(mean(iris[51:100,3]),mean(iris[51:100,4]))
+     virginica <- distance(mean(iris[101:150,3]),mean(iris[101:150,4]))
+     min <- distance(point, setosa)
+     result <- "setosa"
+     if (distance(point, versicolor) < min) 
+     {
+         min <- distance(point, versicolor)
+         result <- "versicolor"
+     }
+     if (distance(point, virginica) < min) {
+         result = "virginica"
+     }
+     
+     return(result)
+     
+     
+ }