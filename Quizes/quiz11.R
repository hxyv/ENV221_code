plant <- read.csv("Data/Plant_height.csv")
library(ggplot2)
ggplot(plant, aes(y = temp, x = loght)) +
    geom_point() +
    geom_point(aes(y = mean(temp), x = mean(loght)), colour = "red", size = 2.5) +
    labs(y = "Temperature", x = "Log(plant height)") +
    theme_classic()

mean_loght <- mean(plant$loght)
mean_temp <- mean(plant$temp)

b <- sum((plant$loght - mean_loght) * (plant$temp - mean_temp)) / 
    sum((plant$loght - mean_loght) ^ 2)
a <- mean_temp - b * mean_loght

c(a, b)


data(package = "EnvStats")
library(EnvStats)
library(ggplot2)
ggplot(Air.df, aes(y = ozone, x = temperature)) +
    geom_point() +
    geom_smooth(method = 'lm', formula = y ~ x) +
    labs(y = "Ozone concentration", x = "Temperature") +
    theme_classic()

new_air <- Air.df[complete.cases(Air.df),]

n = nrow(new_air)
cor(new_air$ozone, new_air$temperature)
sd_ozone <- sd(new_air$ozone, na.rm = TRUE)
sd_temp <- sd(new_air$temperature, na.rm = TRUE)    
mean_ozone <- mean(new_air$ozone, na.rm = TRUE)
mean_temp <- mean(new_air$temperature, na.rm = TRUE)

co <- 1 / (n - 1) * sum((new_air$ozone - mean_ozone) * (new_air$temperature - mean_temp))
cor <- co / (sd_ozone * sd_temp)
round(cor, 4)

b <- sum((new_air$ozone - mean_ozone) * (new_air$temp - mean_temp)) / 
    sum((new_air$temp - mean_temp) ^ 2)
a <- mean_ozone - b * mean_temp

c(a, b)
round(a, 4)
round(b, 4)

dtf <- data.frame(temp = new_air$temperature, ozone = new_air$ozone)
dtf$predicated <- a + b * dtf$ozone
dtf$residual <- dtf$temp - dtf$predicated

## df
n <- nrow(new_air)
dftot <- n - 1
dfres <- n - 2
dfreg <- 1

## ss
sstot <- sum((new_air$temp - mean_temp) ^ 2)

ssres <- sum((dtf$temp - dtf$predicated) ^ 2)
ssreg <- sum((dtf$predicated - mean_temp) ^ 2)

ssreg / sstot

round(cor ^ 2, 4)
