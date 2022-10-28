x <- read.csv('data/students_env221.csv')
tb_gender <- table(x$GENDER)
tb_gender
?table

prop.table(tb_gender)

library(Epi)
Epi::stat.table(list(GENDER), data = x, margins = TRUE)

dtf_gender <- data.frame(tb_gender)
names(dtf_gender) <- c('Gender', 'Frequency')
dtf_gender

# Bar plot is a common way
library(ggplot2)
ggplot(x) + 
    geom_bar(aes(y = GENDER, fill = GENDER))

# A pie chart is good if you have only a few groups.
pie(tb_gender)

# but is a disaster when you have many groups
tb_disp <- table(mtcars$disp)
pie(tb_disp, col = rainbow(length(tb_disp)))
# especially a 3-D pie chart.
library(plotrix)
pie3D(tb_disp)
# instead, use a bar plot

table(x$GENDER, x$HOME)
table(x$HOME, x$GENDER)
table(x$HOME, x$HEIGHT)

x$HOME[x$HOME == ' North China'] <- 'North China'
table(x$GENDER, x$HOME)

tb2 <- table(x$GENDER, x$HOME)
prop.table(tb2)

dtf2 <- data.frame(table(x$GENDER, x$HOME))
names(dtf2) <- c('Gender', 'Home', 'Frequency')
dtf2

library(ggplot2)
ggplot(x) + geom_bar(aes(y = GENDER, fill = HOME), width = 0.2)

ggplot(x) + geom_bar(aes(y = GENDER, fill = HOME), position = 'fill', width = 0.2)

ggplot(x) + geom_bar(aes(x = GENDER, fill = HOME), position = 'dodge')

table(x$GENDER, x$HOME, x$YEAR)

HairEyeColor
Titanic

ggplot(x) + geom_bar(aes(x = GENDER, fill = HOME)) + 
    facet_wrap( ~ YEAR)
