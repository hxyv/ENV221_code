co2 <- read.csv("Data/li7500.csv")[, 1]
co2

# range(co2)
co2_group <- cut(co2, 385:406)
df_co2 <- data.frame(table(co2_group))
df_co2$Probability <- round(df_co2$Freq / sum(df_co2$Freq), 3)
df_co2$Cumulative_Probability <- round(cumsum(df_co2$Freq) / sum(df_co2$Freq), 3)
df_co2

?choose
?dbinom

x <- 2
n <- 2
p <- 0.5
choose(n, x) * p^x * (1-p)^(n-2)
dbinom(x, size = n, prob = p)
dbinom(2, size = 10, prob = 1 / 6)

library(ggplot2)
size <- 20
prob <- 1 / 6
x <- 0:size
dtf <- data.frame(x, d = dbinom(x, size = size, prob = prob))
ggplot(dtf, aes(x, d)) +
    geom_bar(stat = 'identity', width = 1, color = 'white') +
    geom_line(color = 'red', size = 2) +
    labs(y = 'Density')

library(ggplot2)
mu <- 60
sigma <- 3
x <- 40:80
y <- 1 / (sigma * sqrt(2 * pi)) * exp(-1/2 * ((x - mu) / sigma) ^ 2)
dtf <- data.frame(x, y)
ggplot() + 
    geom_line(aes(x, y), dtf) + 
    geom_vline(aes(xintercept = mu + sigma * ((-3):3), 
                   color = c('3sd', '2sd', '1sd', 'mean', '1sd', '2sd', '3sd'))) +
    labs(color = '', y = 'f(x)')

dtf$y1 <- 1 / (sigma * sqrt(2 * pi)) * exp(-1/2 * ((x - (mu - 5)) / sigma) ^ 2)
dtf$y2 <- 1 / (sigma * sqrt(2 * pi)) * exp(-1/2 * ((x - (mu + 5)) / sigma) ^ 2)
dtf$y3 <- 1 / (sigma * sqrt(2 * pi)) * exp(-1/2 * ((x - mu) / (sigma + 1)) ^ 2)
dtf$y4 <- 1 / (sigma * sqrt(2 * pi)) * exp(-1/2 * ((x - mu) / (sigma - 1)) ^ 2)
ggplot(dtf) + 
    geom_line(aes(x, y)) + 
    geom_line(aes(x, y1), color = 'blue') + 
    geom_line(aes(x, y2), color = 'blue') + 
    geom_line(aes(x, y3), color = 'red', linetype = 2) +
    geom_line(aes(x, y4), color = 'red', linetype = 2) +
    labs(y = 'f(x)')

?diff

choose(10, 3)
