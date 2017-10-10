distance <- function(L, W)
{
    return(sqrt(sum((L-W)^2)))
}

classy <- function(x,y){
    point <- distance(x, y)
    setosaL <- mean(iris[1:50,3])
    setosaW <- mean(iris[1:50,4])
    setosa <- distance(setosaL, setosaW)
    versicolor <- distance(mean(iris[51:100,3]),mean(iris[51:100,4]))
    virginica <- distance(mean(iris[101:150,3]),mean(iris[101:150,4]))
    min <- distance(point, setosa)
    result <- "setosa"
    if (distance(point, versicolor) < min)
    {
        min <- distance(point, versicolor)
        result <- "versicolor"
    }
    if (distance(point, virginica) < min)
    {
        result <- "virginica"
    }
    return(result)
}

cn <- function(L,W)
{
    min <- Inf
    mini <- 0
    for (i in 1:150)
    {
        if(distance(c(L,W), c(iris[i,3],iris[i,4])) < min){
            min <- distance(c(L,W),c(iris[i,3], iris[i,4]))
            mini <- i
			
			#debug
            #print(paste(c(i,distance(c(L,W),c(iris[i,3], iris[i,4]))),sep=" "))
        }
    }
    if (mini <= 50)
    {
        return ("setosa")
    }
    if (mini > 100)
    {
        return("virginica")
    }
    return("versicolor")
}

ShowclassMap <- function ()
{
    dev.new(width=5, height=4)
    colors <- c("setosa" = "red", "versicolor" = "green3",
                "virginica" = "blue")
    plot(iris[, 3:4], pch = 21, bg = colors[iris$Species], col =
             colors[iris$Species], asp = 1)
    for (i in (seq(0,3,0.1)))
    {
        for (j in (seq(0,8,0.1))){
            points(j,i,pch = 22, bg = colors[cn(j,i)], asp=1)
        }
    }
}





