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
for(i in 3){
    
}
?write.csv
