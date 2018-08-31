# Built in R features

# Example Vector
vector <- c(1:20)
# Creates sequestes, takes 3 arguments,
# 1. Where it starts, 2. Where it ends, 3. the "by=", how it should just foreach step
seq(0, 20, by = 10) # gives (0, 10, 20)
# Sorts vectors
sort(vector, decreasing = TRUE) # vector, decreasing = TRUE/FALSE
# Reverse the object
rev(vector) # 20 .. 1
# Show the structure of the object
str(vector) # int[1:20] 1 .. 20
# Merge lists and vectors together
append(vector, 21:25)
# is. checks the class is correct.
is.vector(vector)
# as. convert to this data-type
as.list(vector)
# Returns random numbers
sampe(x = 100, 3)

add.random <- function(x) {
    rand <- sample(1:100, 1)
    return(x+rand)
}

# Applies the function to every vector, and returns a list
lapply(vector, add.random)
# Apples the function to every vector, and returns a vector
sapply(vector, add.random)
# Anonymous functions
sapply(vector, function(num) {num * 2})

# Math functions
abs() # Computes the absolute value
sum() # returns the sum of values
mean() # computes the arithemitc mean
round() # Rounds values, more arguments for nearest, digits = 2

text <- "Hi, do you know who you are voting for?"
# Regular expressions
grepl('voting', text) # Returns logical TRUE/FALSE
grep() # Returns index of searched object

# Dates
Sys.Date() # TODAY
# Normal dates in R
date <- "1990-01-01" %>% as.Date()
# Or formating like this
my.date <- as.Date("Nov-03-90", format = "%b-%d-%y")