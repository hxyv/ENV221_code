# 1. calculate 1+2+3+...+100
sum(1:100)

# 2. y=exp(ax)+b, a=3.2, b=98. Calculate the y values when x=0.2, 2, 20, 200
exp_y <- function(a, b, x) {
    exp(a * x) + b
}
exp_y(3.2, 98, 0.2)
exp_y(3.2, 98, 2)
exp_y(3.2, 98, 20)
exp_y(3.2, 98, 200)

# The air quality dataset was introduced in Week1. Download it from LMO and 
# import it into R. This and the subsequent tasks will do some analysis based on 
# this dataset.
#
# 3.1 How many rows and columns does this data frame have?
df_aq <- read.csv("Data/airquality.csv")
cat("Numbers of rows: ", nrow(df_aq))
cat("Numbers of columns: ", ncol(df_aq))

# 3.2 (Continued) What was the temperature on June 22?
cat("The temperature is: ", df_aq[with(df_aq, Month==6 & Day==22), 'Temp'])

# 3.3 (Continued) What was the mean early afternoon ozone concentration (ppb) in June?
mean(df_aq[df_aq$Month==6, "Ozone"], na.rm=TRUE)

# 3.4 (Continued) What was the mean, maximum, minimum, median of the morning wind 
# speed in the whole dataset?
cat("Mean = ", mean(df_aq$Wind))
cat("Maximum = ", max(df_aq$Wind))
cat("Minimum = ", min(df_aq$Wind))
cat("Median = ", median(df_aq$Wind))
summary(df_aq$Wind)

# 3.5 (Continued) The temperature in the dataset was given in F. Add a new column
# for the temperature in C.
Celsius <- round((df_aq$Temp - 32) / 1.8)
df_aq$Celsius <- Celsius

# 3.6 (Continued) Save the frame as a .csv file.
write.csv(df_aq, "Data/airquality_new.csv", row.names = FALSE)

# The ENV211 Students dataset was introduced in Week 1. Download it from LMO and
# import it into R. This and the subsequent tasks will do some analysis based on
# this dataset.
#
# 4.1 How many rows and columns does this data frame have?
stud <- read.csv("Data/students_env221.csv")
cat("Numbers of rows: ", nrow(stud))
cat("Numbers of columns: ", ncol(stud))

# 4.1 (Continued) What is the hometown of the student No. 16?
stud[stud$ID==16, "HOME"]

# 4.2 (Continued) What is the mean height of male and female students, respectively?
cat("Average height of male student: ", mean(stud[stud$GENDER=="Male", "HEIGHT"]))
cat("Average height of female student: ", mean(stud[stud$GENDER=="Female", "HEIGHT"]))
tapply(stud$HEIGHT, stud$GENDER, mean)

# 4.3 (Continued) What is the mean, maximum, minimum, median of the shoe size in 
# the whole dataset?
cat("Mean = ", mean(stud$SHOE))
cat("Maximum = ", max(stud$SHOE))
cat("Minimum = ", min(stud$SHOE))
cat("Median = ", median(stud$SHOE))
summary(stud$SHOE)

# 4.4 (Continued) How many students knew nothing about statistics? How about R?
cat(sum(stud$STAT=="1. I know nothing about it.", na.rm=TRUE), 
    " and ", 
    sum(stud$R=="1. I know nothing about it.", na.rm=TRUE), 
    " students kenw nothing about statistics and R, respectively.")
    
# 4.5 (Continued) Body mass index (BMI) is a measure of body fat based on height
# and weight that applies to adult men and women. Add a new column as the BMI.
BMI <- round(stud$WEIGHT / (stud$HEIGHT / 100) ^ 2, 1)
stud$BMI <- BMI

# 4.6 （Continued) Save the data frame as a .csv file.
write.csv(stud, "Data/students_ENV221_new.csv", row.names = FALSE)
