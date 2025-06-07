# Basics of R code
# the chunks below are shown to students in the first few sessions to help them
# learn data structures, variable assignments, and basic stats functions in R

# comments are provided in the code blocks to help

#######
# Making an assignment

#You can assign data/information/numbers to variables using an arrow (<-)

x <- 2

# You can also make more complex assignments like data frames
df <- data.frame("info" = c(1, 2, 3, 4, 5),
                 "more" = c("red", "blue", "green", "yellow", "ivory"))

# or vectors of data like a names
names <- c("Ian", "Nithesh", "Adrianne", "Micky", "Heath", "Kenan", "Reafa", "Ruby")

# These assignments show up in the **Environment tab** of the top right panel of RStudio

#######


# variables can be used in math equations
# assign the variables
x <- 2

y <- 3

# to run or evaluate the code, highlight the code the press 'Run' at top right
# alternatively, put your cursor on the line and press Ctrl+Enter or Command+Enter
# the output will show up in the console window
x^2 + y^3


#######

# There a lots of standard equations and math/stats functions built into R.

# make the data set
meannum <- c(1, 2, 3, 5, 10, 6, 7, 12, 101)

# calculate the mean, median, and standard deviation for the data
mean(meannum)

median(meannum)

sd(meannum)

#######

