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
# Most used, includes time
as.POSTXCT()
# Should be used
strptime()

# Pipe operator
# Works like promises 
result <- mtcars %>% filter(mpq > 20) %>% sample_n(size = 5) %>% arrange(desc(mpq))

# Data manipulation
library(Dplyr) # Manipulation of data
fliter(flights, month == 11, day == 3, carrier, 'AA') # Overrules the normal filter
slice(flights, 1:10) # Returns the amount of rows in a dataframe 
arrange(flights, year, month, day, airtime) # Reorders the row after parameters
select(flights, carrier) # Takes out parameters with lesser syntax
rename(flights, airline_carrier = carrier) # Renames columns, replaces the old
distinct(select(flights, carrier)) # Takes all the unique values
mutate(flights, new_col = arr_delay-dep_deplay) # Creates a new column and remakes the args
transmute() # Same as mutate, but returns the "new row"
summarise(flights, avg_air_time = mean(air_time, na.rm = T)) # Works like aggregate
sample_n(flights, 10) # Returns random rows (10)
sample_frac(flights, 0.1) # Returns a fraction of rows (%)

library(tidyr) # Cleaning Data
gather(df, Quarter, Revenue, Quarter1:Quarter4) # Collapses multiple columns into fewer
spread(stocks, price) # Reverses the gather