dtf <- data.frame(
    cost = c(1896, 2606, 1649, 2436, 2811, 2384, 2840, 2445, 
             1712, 2096, 1923, 2281, 2703, 2092, 1499, 2146, 
             1689, 2256, 1834, 2365, 1958, 1947, 2433, 1578, 
             1455, 1164, 1851, 1776, 2030, 1640, 1678, 1547),
    region = rep(c('Northeast', 'Midwest', 'South', 'West'), each = 8))

# df
k <- 4
n <- nrow(dtf)
dfw <- (n - k) %>% print()
dfb <- (k - 1) %>% print()
dft <- (n - 1) %>% print()

# mean
xbar <- mean(dtf$cost)
xibar <- dtf %>%
    group_by(region) %>%
    summarize(mean = mean(cost)) %>%
    as.data.frame()

# SS
ssw1 <- sum((select(filter(dtf, region == "Northeast"), cost) - xibar[2, 2]) ^ 2)
ssw2 <- sum((select(filter(dtf, region == "Midwest"), cost) - xibar[1, 2]) ^ 2)
ssw3 <- sum((select(filter(dtf, region == "South"), cost) - xibar[3, 2]) ^ 2)
ssw4 <- sum((select(filter(dtf, region == "West"), cost) - xibar[4, 2]) ^ 2)
ssw <- (ssw1 + ssw2 + ssw3 + ssw4) %>% print()

ssb1 <- nrow(dtf[dtf$region == "Northeast",]) * (xibar[2, 2] - xbar) ^ 2
ssb2 <- nrow(dtf[dtf$region == "Midwest",]) * (xibar[1, 2] - xbar) ^ 2
ssb3 <- nrow(dtf[dtf$region == "South",]) * (xibar[3, 2] - xbar) ^ 2
ssb4 <- nrow(dtf[dtf$region == "West",]) * (xibar[4, 2] - xbar) ^ 2
ssb <- (ssb1 + ssb2 + ssb3 + ssb4) %>% print()

## Double check
sst <- (sum((dtf$cost - xbar) ^ 2)) %>% print()
ssw + ssb

# Test statistic --- F score
msw <- ssw / dfw
msb <- ssb / dfb
f_score <- (msb / msw) %>% round(2) %>%print()
f_critical <- qf(0.9, df1 = dfb, df2 = dfw) %>% round(2) %>% print()
qvalue <- pf(f_score, df1 = dfb, df2 = dfw, lower.tail = FALSE) %>% print()

ggplot(dtf, aes(x = region, y = cost)) +
    geom_boxplot() +
    theme_classic() +
    labs(x = "Region", y = "Cost ($)")
