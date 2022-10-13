# 1. What are the following functions used for? Create a table with the function 
# names as one column and the function usage as another.
# https://stackoverflow.com/questions/9192589/how-can-i-extract-text-from-rs-help-command
extract_help <- function(pkg, fn = NULL, to = c("txt", "html", "latex", "ex")){
    to <- match.arg(to)
    rdbfile <- file.path(find.package(pkg), "help", pkg)
    rdb <- tools:::fetchRdDB(rdbfile, key = fn)
    convertor <- switch(to, 
                        txt   = tools::Rd2txt, 
                        html  = tools::Rd2HTML, 
                        latex = tools::Rd2latex, 
                        ex    = tools::Rd2ex
    )
    f <- function(x) capture.output(convertor(x))
    if(is.null(fn)) lapply(rdb, f) else f(rdb)
}

extract_help("base", "plot", "html")
extract_help("graphics", "hist")

# 2. The air quality dataset was introduced in Lecture 1. Import it into R. This
# and the subsequent tasks will do some analysis based on this dataset.
#
# 2.1 Make a boxplot of the early afternoon ozone concentration in June.
boxplot(airquality[airquality$Month == 6, 1],
        main = "Boxplot of the early afternoon ozone concentration in June",
        ylab = "Ozone Concentration")

ozone_boxplot <- ggplot(airquality[airquality$Month == 6,]) + 
    geom_boxplot(aes(Ozone)) +
    labs(title = "Boxplot of the early afternoon ozone concentration in June",
         x ="Ozone Concentration")

ozone_boxplot

# 2.2 Make a histogram of the early afternoon ozone concentration in June.
hist(airquality[airquality$Month == 6, 1],
     main = "Histogram of the early afternoon ozone concentration in June",
     xlab = "Ozone Concentration")

ozone_histogram <- ggplot(airquality[airquality$Month == 6,]) +
    geom_histogram(aes(Ozone)) +
    labs(title = "Histogram of the ealy afternoon ozone concentration in June",
         x = "Ozone Concentration", 
         y = "Frequency")

ozone_histogram

# 2.3 Check the components of these figures. Complete them if missing. Beautify them.

# 2.4 Save the boxplot and histogram as .pdf files.
library(GGally)
ggsave("Ozone_boxplot.pdf", ozone_boxplot, path = 'Graphs')
ggsave("Ozone_histrogram.pdf", ozone_histogram, path = 'Graphs')

# 3. The ENV221 Students dataset was introduced in Lecture 2. Import it into R.
# This and the subsequent tasks will do some analysis based on this dataset.
#
# 3.1 Make a scatter plot for the weight against the height.
stud <- read.csv('Data/students_env221.csv')

stud_weight_height_scatter <- ggplot(stud, aes(x = HEIGHT, y = WEIGHT)) +
                                geom_point() +
                                geom_smooth(method = "lm") +
                                labs(title = "Relation between weight and height",
                                     x = "Height /cm",
                                     y = "Weight /kg")

stud_weight_height_scatter

# 3.2 Make a histogram of the BMI for the female and male students, respectively.
stud_new <- read.csv('Data/students_ENV221_new.csv')

male_bmi <- ggplot(stud_new[stud_new$GENDER == 'Male',]) +
                geom_histogram(aes(BMI)) + 
                labs(title = "BMI of male students",
                     y = "Frequency")

male_bmi

female_bmi <- ggplot(stud_new[stud_new$GENDER == 'Female',]) +
                geom_histogram(aes(BMI)) + 
                labs(title = "BMI of female students",
                     y = "Frequency")

female_bmi

# 3.3 Make a bar plot of the number of the students at different levels in 
# Statistics and R.
stat_bar <- ggplot(stud) +
                geom_bar(aes(STAT)) +
                labs(title = "Number of the students at different levels in Statistics",
                     x = "Knowledge Level",
                     y = "Frequency")

stat_bar

r_bar <- ggplot(stud) + 
            geom_bar(aes(R)) +
            labs(title = "Number of the students at different levels in R",
                 x = "Knowledge Level",
                 y = "Frequency")

r_bar

# 3.4 Make a pair plot of all the numeric variables in the dataset.
numeric_pairs <- ggpairs(stud_new[, c(4, 5, 6, 7, 12)], 
                         aes(colour = stud$GENDER, alpha = 0.5))


# 3.5 Check the components of these figures. Complete them if missing. Beautify them.

# 3.6 Save the graphs as .pdf files.
ggsave('stud_weight_height_scatter.pdf', 
       stud_weight_height_scatter, 
       path = 'Graphs')

ggsave('male_bmi.pdf', male_bmi, path = 'Graphs')
ggsave('female_bmi.pdf', female_bmi, path = 'Graphs')

ggsave('stat_bar.pdf', stat_bar, path = 'Graphs')
ggsave('r_bar.pdf', r_bar, path = 'Graphs')

ggsave('numeric_paris.pdf', numeric_pairs, path = 'Graphs')

