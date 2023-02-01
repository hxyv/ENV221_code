tb <- data.frame(
    Endangered = c(162, 143, 38, 17, 45),
    Threatened = c( 18,  16, 19, 10, 32), 
    row.names = c('Mammals', 'Birds', 'Reptiles', 'Amphibians', 'Fish'))

chisq.test(dtf)

tb2 <- matrix(nrow = 5, ncol = 2)
tb2[1, 1] <- sum(tb[1, ]) / sum(tb) * sum(tb[, 1])
tb2[2, 1] <- sum(tb[2, ]) / sum(tb) * sum(tb[, 1])
tb2[3, 1] <- sum(tb[3, ]) / sum(tb) * sum(tb[, 1])
tb2[4, 1] <- sum(tb[4, ]) / sum(tb) * sum(tb[, 1])
tb2[5, 1] <- sum(tb[5, ]) / sum(tb) * sum(tb[, 1])
tb2[1, 2] <- sum(tb[1, ]) / sum(tb) * sum(tb[, 2])
tb2[2, 2] <- sum(tb[2, ]) / sum(tb) * sum(tb[, 2])
tb2[3, 2] <- sum(tb[3, ]) / sum(tb) * sum(tb[, 2])
tb2[4, 2] <- sum(tb[4, ]) / sum(tb) * sum(tb[, 2])
tb2[5, 2] <- sum(tb[5, ]) / sum(tb) * sum(tb[, 2])

chi_critical <- qchisq(0.99, df = 4)
chi_critical

chi_sq <- sum((tb2 - tb) ^ 2 / tb2)
chi_sq