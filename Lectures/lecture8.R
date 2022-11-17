# The population mean
mu <- 100
# The population sd
sigma <- 15

# According to CLT:
# The mean of the samplng distribution of the mean
mu_xbar <- mu
# The sample size
n <- 9
# The standard error of the mean
se <- sigma / sqrt(n)

x <- seq(70, 130, 0.1)
y <- dnorm(x, mean = mu_xbar, sd = se)
plot(x, y, type = "l", las = 1, ylab = 'f(x)', las = 1)
abline(v = c(mu_xbar + se * (-2):2),
       col = c('red', 'blue', 'grey', 'blue', 'red'))
?dnorm

par(mfrow = c(1, 2))
n <- c(5, 10, 15, 20)
m <- n

coln <- 1
curve(df(x, df1 = n[1], df2 = m[1]), xlim = c(0, 5), ylim = c(0, 0.7), 
      xlab = "F", ylab = "Density", col = coln, las = 1)
for (nn in n[2:4]) {
    coln <- coln + 1
    curve(df(x, df1 = nn, df2 = m[1]), add = TRUE, col = coln)
}
legend("topright", legend = paste(n, m[1]), col = 1:4, lty = 1, bty = "n")

coln <- 1
curve(df(x, df1 = n[1], df2 = m[1]), xlim = c(0, 5), ylim = c(0, 0.7),
      xlab = "F", ylab = "Density", col = coln, las = 1)
for (mm in m[2:4]) {
    coln <- coln + 1
    curve(df(x, df1 = n[1], df2 = mm), add = TRUE, col = coln)
}
legend("topright", legend = paste(n[1], m), col = 1:4, lty = 1, bty = "n")

x1 <- c(24.58, 22.09, 23.70, 18.89, 22.02, 28.71, 24.44, 20.91, 23.83, 20.83)
x2 <- c(21.61, 19.06, 20.72, 15.77, 19, 25.88, 21.48, 17.85, 20.86, 17.77)

n <- length(x1)
m <- length(x2)
xbar1 <- mean(x1)
xbar2 <- mean(x2)
var1 <- var(x1)
var1 # [1] 7.345622
var2 <- var(x2)
var2 # [1] 7.776311
F_score <- var2 / var1
F_score # [1] 1.058632
F_critical <- qf(0.975, df1 = m-1, df2 = n-2)
F_critical # [1] 4.025994
# df1 numerator, df2 denominator
pf(F_score, df1 = m-1, df2 = n-1, lower.tail = FALSE) * 2 # [1] 0.9337528
var.test(x2, x1, ratio = 1, alternative = "two.sided", conf.level = 0.95)
