stud <- read.csv("Data/students_ENV221_new.csv")
mean_height <- mean(stud$HEIGHT)
mean_shoe <- mean(stud$SHOE)
b <- sum((stud$HEIGHT - mean_height) * (stud$SHOE - mean_shoe)) / sum((stud$HEIGHT - mean_height) ^ 2)
a <- mean_shoe - b * mean_height
c(a, b)

shoe_size <- function(height = 1){
    shoe_size <- b * height + a
}

stud$y_prime <- shoe_size(stud$HEIGHT)
stud$residue <- stud$SHOE - stud$y_prime

env_lm <- lm(stud$SHOE ~ stud$HEIGHT)
summary(env_lm)
