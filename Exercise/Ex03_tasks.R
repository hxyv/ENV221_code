# 1.The Iris data was introduced in Lecture 1. Import it into R. This and the
# subsequent tasks will do some analysis bases on this dataset.
#
# 1.1 Insert a column named 'petal_width_level' in the iris data, showing whether
# petal length is greater than 4. Two values in this column "< 4", ">= 4".
iris$petal_width_level <- ifelse(iris$Petal.Length < 4,
                                 '< 4',
                                 '>= 4')

# 1.2 Insert a column named 'sepal_width_level' in the iris data, showing whether
# the sepal width is greater or smaller than 3. Three values in this column: "< 3"
# "= 3", "> 3".
iris$sepal_width_level <- ifelse(iris$Sepal.Width > 3, 
                                 '> 3', 
                                 ifelse(iris$Sepal.Width == 3, 
                                        '= 3', 
                                        '> 3'))

# 1.3 Use the loop function: cut the iris data frame into three data frames based
# on the three kinds of iris species, and save each of them in a '.csv' file.
setosa <- data.frame()
versicolor <- data.frame()
virginica <- data.frame()

for(i in 1:nrow(iris)){
    if(iris$Species[i] == 'setosa'){
        setosa <- rbind(setosa, iris[i,])
    } else if(iris$Species[i] == 'versicolor'){
        versicolor <- rbind(versicolor, iris[i,])
    } else if(iris$Species[i] == 'virginica'){
        virginica <- rbind(virginica, iris[i,])
    }
    
    if(i == nrow(iris)){
        write.csv(setosa, 'Data/setosa.csv', row.names = FALSE)
        write.csv(versicolor, 'Data/versicolor.csv', row.names = FALSE)
        write.csv(virginica, 'Data/virginica.csv', row.names = FALSE)
    }
}

# 2 Body mass index is a measure of body fat based on height and weight that applies
# to adult men and women. 
#
# 2.1 Create a self-defined function for calculating BMI from the height and weight.
bmi <- function(height, weight){
    x <- weight / height ^ 2
    return(x)
}

bmi2 <- function(height, weight){
    if(height > 5){
        x <- weight / (height / 100) ^2
    } else {
        x <- weight / height ^ 2
    }
    
    x <- round(x, 2)
    return(x)
}

# 2.2 Apply this function to the ENV221 students dataset and add a new column for
# the BMI values.
df_stud <- read.csv("data/students_env221.csv")
df_stud$BMI <- bmi(df_stud$HEIGHT/100, df_stud$WEIGHT)

# 3.1 Install the MSG package from GitHub ("yihui/MSG").
library(remotes)
install_github("yihui/MSG")

# 3.2 What can MSG used for?
?MSG

# 3.3 How popular is MSG?
library(beginr)
beginr::plotpkg("MSG")

# 3.4 What is the function msg() used for?
?msg()

# 3.5 Who are the authors of MSG? Can you search the internet for more information
# of them?
# https://yihui.org/

# 3.6 Give the citation of the MSG package.
citation('MSG')