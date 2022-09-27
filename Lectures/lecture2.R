1 + 2 - 4 * 5 / 6 ^ 2
1 + (2 - 4 * (5 / 6)) ^ 2
2 ^ 0.5
7 %/% 3
7 %% 3
?`%/%`

round(3.1421312, 10)
round(3.123, 3)
round(3.123, 4)
round(3, 3)
round(3.1, 3.1)
round(3, 3.123)
1:9 -> x
x
x <- 1:9
x
assign('x', 1:9)
x
assign('y' <- 'x', 1:9)
y
x
assign('y' <- x, 1:9)
?assign
x
x[7]
x[0]
sqrt(x)
mean()
mean(x)
range(x)
sd(x)
log10(x)
median.default(x)
x[x]
x <- c(29, 28, 28, NA, 30)
mean(x, na.rm=F)
df_manual <- data.frame(age = c(21, 31, 23, 40, 36),
                        gender = c('f', 'm', 'm', 'f', 'f'))
df_manual
mean(df_manual$age)

df_manual$age - 2
2022 - df_manual$age
mean(df_manual$age)
round(sd(df_manual$age), 2)
summary(df_manual)
names(df_manual) <- c('x', 'y')
df_manual
names(df_manual) <- c('age', 'gender')
df_manual
df_aq <- read.csv('airquality.csvde')
df_aq
summary(df_aq)
x <- df_aq
x
summary(x)
data()
iris
names(iris)
data(iris)
ToothGrowth
plot(ToothGrowth)
