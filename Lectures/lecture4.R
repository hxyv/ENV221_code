x <- 1:10
plot(x)

plot(iris$Sepal.Length, col = "red")

plot(iris$Sepal.Length, 
     iris$Sepal.Width, 
     xlab = "Sepal Length (cm)",
     ylab = "Sepal Width (cm)")

help(plot)

hist(iris$Sepal.Length)
hist(iris$Sepal.Width)

boxplot(iris$Sepal.Length)
boxplot(iris$Sepal.Width, iris$Sepal.Length)

pairs(iris[, 1:4])
pairs(iris[, 1:2])

plot(iris$Sepal.Length, col = ifelse(iris$Species == "setosa", 
                                     "red",
                                     ifelse(iris$Species == "versicolor", 
                                            "blue",
                                            "green")))

colors()
beginr::plotcolors()

plot(iris$Sepal.Length, 
     col = "red", 
     cex = 1, 
     pch = ifelse(iris$Species == "setosa", 
                  13,
                  ifelse(iris$Species == "versicolor", 
                         12,
                         20)))

beginr::plotpch()

plot(iris$Sepal.Length, type = "l")

beginr::plottype()

lines(iris$Length)
points(iris$Length)
abline(iris$Length)
arrows(iris$Length)
axis(iris$Length)
legend(iris$Length)
text(iris$Length)
mtext(iris$Length)
expression(iris$Length)
