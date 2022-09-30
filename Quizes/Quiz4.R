# 1. Thomas wrotes an R script as follows. He runs it and get an error. Explain 
# what the error is and give the corrected code.
# for (h in trees$Height) {
#    if (h > 80) [
#        print('tall')
#    ] else [
#        print('short')
#    ]
# }
# In 'if else' statement, Thomas should use '{}' instead of '[]'.
# The correct form of the script is:
for (h in trees$Height) {
    if (h > 80) {
        print('tall')
    } else {
        print('short')
    }
}

# 2. Explain what the argument 'digits' mean in the R function 'round()'.
?round
# integer indicating the number of decimal places (round) or significant digits 
# (signif) to be used. For round, negative values are allowed (see ‘Details’).

# 3. What is the R code for installing the R package 'fecitr' from GitHub developer
# "pzhaonet"?
library(remotes)
install_github("pzhaonet/fecitr")

# 4. How do you cite the R package "ggplot2" in the publications? Give the reference
# suggested by R.
citation('ggplot2')
