# 1. Give three ways of assigning the value 29 to the object "x" in R.
x = 29
x <- 29
assign('x', 29)

# 2. In R you can get the π value with the constant object "pi". Give the R code 
# for getting the value of the Euler's number "e" (the base for natural logarithms).
eul <- exp(1)

# 3. "trees" is a R built-in dataset, showing some variables for black cherry trees. 
# Give the R code for getting only the name of the 2nd column of this data frame. 
df_tree <- trees
names(df_tree[2])

# 4. Give the R code for calculating only the minimum of every column in the "trees" 
# dataset in R.
apply(df_tree, 2, min)
