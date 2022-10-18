x <- read.csv('Data/students_env221.csv')
sample(x$ID, 10)
x$ID
set.seed(1)
sample(x$ID, 10)
set.seed(2)
sample(x$ID, 10)
expand.grid(coin = c("head", "tail"), die = 1:6)
?expand.grid
# Create a data frame from all combinations of the supplied vectors or factors. 
# See the description of the return value for precise details of the way this is
# done.

x <- c(0, 1)
sample(x,1)
sample(x, 1)
sample(x, 1)

y1 <- sample(x, 10000, replace = TRUE)

y2 <- cumsum(y1)

e_coin <- data.frame(n = 1:10000, y1, y2)
e_coin$p <- e_coin$y2 / e_coin$n

library(ggplot2)
ggplot(e_coin) + 
    geom_point(aes(n, p)) +
    lims(y = c(0,1)) +
    geom_hline(yintercept = 0.5, color = 'red') 


table(x$GENDER)

sample(x$ID[x$GENDER == 'Female'], 5)
sample(x$ID[x$GENDER == 'Male'], 5)

idfemale <- x$ID[x$GENDER == 'Female']
sample(idfemale, 5)
idmale <- x$ID[x$GENDER == 'Male']
sample(idmale, 5)

sample(idfemale, length(idfemale) * 0.3)
sample(idfemale, length(idmale) * 0.3)

n_clu <- 1
perclu <- 3
sample_clu <- sample(1: (nrow(x) / perclu), n_clu)
i_clu <- (perclu * (sample_clu - 1) + 1) : (perclu * sample_clu)
x[i_clu]
