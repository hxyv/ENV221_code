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
     col = ifelse(iris$Species == "setosa",
                  "red",
                  ifelse(iris$Species == "versicolor",
                         "blue",
                         "darkgreen")), 
     cex = 1, 
     pch = ifelse(iris$Species == "setosa", 
                  17,
                  ifelse(iris$Species == "versicolor", 
                         12,
                         19)))

beginr::plotpch()

plot(iris$Sepal.Length, type = "l")

beginr::plottype()

?axis
axis(side = 4)
beginr::plotlty()
beginr::plotcolorbar()
?hcl
hcl(1)
csd <- matrix(c( 4,2,4,6, 4,3,1,4, 4,7,7,1,
                 0,7,3,2, 4,5,3,2, 5,4,2,2,
                 3,1,3,0, 4,4,6,7, 1,10,8,7,
                 1,5,3,2, 1,5,2,1, 4,1,4,3,
                 0,3,0,6, 2,1,5,5), nrow = 4)

csphd <- function(colors)
    barplot(csd, col = colors, ylim = c(0,30),
            names.arg = 72:85, xlab = "Year", ylab = "Students",
            legend.text = c("Winter", "Spring", "Summer", "Fall"),
            main = "Computer Science PhD Graduates", las = 1)


library(ggplot2)

ggplot(iris) + 
    geom_point(aes(x = Sepal.Length, y = Sepal.Width))

ggplot(iris) +
    geom_point(aes(x = Sepal.Length, 
                   y = Sepal.Width), 
               color = ifelse(iris$Species == "setosa",
                              "red",
                              ifelse(iris$Species == "versicolor",
                                     "blue",
                                     "darkgreen")))

ggplot(iris) +
    geom_point(aes(x = Sepal.Length, y = Sepal.Width, color = Species))

ggplot(iris) +
    geom_point(aes(x = Sepal.Length, y = Sepal.Width, color = "blue"))

ggplot(iris) +
    geom_point(aes(x = Sepal.Length, y = Sepal.Width), color = "blue")

ggplot(iris) +
    geom_point(aes(x = Sepal.Length, y = Sepal.Width, color = Sepal.Width, size = Sepal.Length))

oggplot(iris) +
    geom_point(aes(x = Sepal.Length, y = Sepal.Width), size = 3)

ggplot(iris) +
    geom_point(aes(x = Sepal.Length, y = Sepal.Width, size = Species))

ggplot(iris) +
    geom_point(aes(x = Sepal.Length, y = Sepal.Width), shape = 2)

# beginr::plotpch()
ggplot(iris) +
    geom_point(aes(x = Sepal.Length, y = Sepal.Width, shape = Species))

ggplot(iris) +
    geom_point(aes(x = Sepal.Length, y = Sepal.Width)) +
    geom_smooth(aes(x = Sepal.Length, y = Sepal.Width))

ggplot(iris, aes(x = Sepal.Length, y = Sepal.Width)) +
    geom_point() +
    geom_smooth(method = "lm")

ggplot(iris, aes(x = Sepal.Length, y = Sepal.Width)) +
    geom_smooth(method = "lm")

ggplot(iris) +
    geom_point(aes(x = Sepal.Length, y = Sepal.Width)) + 
    facet_wrap(~ Species)


ggplot(iris) +
    geom_point(aes(x = Sepal.Length, y = Sepal.Width)) + 
    theme_light()

ggplot(iris) + 
    geom_bar(aes(Species))
?aes

ggplot(iris) +
    geom_bar(aes(Species)) +
    coord_flip()

ggplot(iris) + geom_histogram(aes(Sepal.Length))

ggplot(iris) + geom_boxplot(aes(Sepal.Length))

install.packages("GGally")
# install.packages("GGally")
library(GGally)
ggpairs(iris, aes(colour=Species, alpha=0.5))

install.packages("plotyly")
library(plotly)
plot_ly(x = iris$Sepal.Length, y = iris$Sepal.Width)

p1 <- ggplot(iris) +
    geom_point(aes(x = Sepal.Length, y = Sepal.Width, color = Species))
ggplotly(p1)

p2 <- ggpairs(iris, aes(colour=Species, alpha=0.5))
ggplotly(p2)

install.packages("rgl")
x <- seq(-10, 10, length = 20)
y <- x
f <- function(x, y) {r <- sqrt(x^2 + y^2); 10 * sin(r)/r}
z <- outer(x, y, f)
z[is.na(z)] <- 1

library(rgl)
persp3d(x, y, z, col = "darkgreen")

library(MSG)
msg("mtcars-smooth")

msg("diamonds-hex")
msg("ggplot2-violin")

msg("iris-ggplot2")
msg("quake6-bubbles")

msg("diamonds-cut")
msg("diamonds-polar")

pdf('df_plot.pdf')
plot(iris$Sepal.Length)
dev.off()

ggpairs(iris, aes(colour = Species, alpha = 0.5))
ggsave("df_ggpairs.pdf")
