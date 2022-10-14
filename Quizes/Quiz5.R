# 1. You plot the height in the 'trees' dataset in R with the function:
# plot(trees$Height)
# and you get a scatterplot with open circles. How do you plot it in closed triangles?
plot(trees$Height, pch = 17)

# You make a histogram for the height in the "trees" dataset with:
# hist(trees$Height)
# In the figure, what does the highest bar with a height of 10 mean?
hist(trees$Height)
# There are 10 trees's height are between 75 and 80.

# Emily makes a scatter plot with the R ggplot2 package.
# library(ggplot2)
# ggplot(trees) +
#   geom_point(aes(x = Height, y = Volume, color = "blue))
# She wants the plotting character in blue, but what she gets is in pink. Why?
library(ggplot2)
ggplot(trees) + 
    geom_point(aes(x = Height, y = Volume), color = "blue")

# Thomas wants to save a ggplot2 figure as a pdf file:
# ggsave("output.pdf")
# How can he customize the width as 10 inches and height as 6 inches for the pdf file?
?ggsave
ggsave("output.pdf", width = 10, height = 6, units = "in", path = "Graphs")
