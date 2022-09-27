y <- 1:5
y[TRUE]
y[FALSE]
y[c(FALSE, TRUE)]
y[c(TRUE, FALSE, FALSE)]


(TRUE + TRUE) ^ 2

hour <- 12
if(hour == 12) {
    print('Go!')
    x <- 1
}
x
y

z <- "small"

ifelse(y > 2, 'large', y <- 'small')
y

iris$long_sepal <- ifelse(
    iris$Sepal.Length > mean(iris$Sepal.Length), 
    'long', 
    'short')
iris$big <- ifelse(
    iris$Sepal.Length > mean(iris$Sepal.Length) & iris$Sepal.Width > mean(iris$Sepal.Width), 
    'big', 
    'small')

repeat print(1)

convert_windspeed <- function(x){
    y <- x * 1.609344 * 1000 / 3600
#    return(y)
}

a <- convert_windspeed(100)
a

a <- c(1, 2, 3, NA)
mean(a, na.rm=TRUE)

.libPaths()

install.packages("plotrix")
library(plotrix)
demo(plotrix)
?plotrix





