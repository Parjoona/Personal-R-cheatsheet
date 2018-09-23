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
separate(df, which.to.separate, c('col1','col2')) # separates using values thats non characters etc.
unite(df, joined.col, col1, col2) # Reverses the separate

# Layers of data visualization with GGPLOT2
library(ggplot2)
# Data - library
# Aestehtics = aes(x=, y=)
# Geometry - geom_point()
# Facets - lets us put multiple plots on the same grid
# Statistics - facets_grid() gives the extra layers
# Coordinates -coord_cartesian(xlim = vector)
ggplot(data = mtcars) # Data
pl <- ggplot(data = mtcars, aes(x = mpg, y = hp)) # Aestehtics
pl <- pl + geom_point() # Geomtry
pl <- pl + facet_grid(cyl ~ .) # Separates the plots depending on how many cylinders they have
pl2 <- pl + stat_smooth() # Smoothing out the curves
pl2 <- coord_cartesian(xlim = c(15:25))
# Theme layer - adding to the theme layer
pl2 <- pl2 + theme_bw()

# Using ggplot2movies library
install.packages('ggplot2movies')
library(ggplot2movies) # (movies)
# Histogram
# Data & Aesthetics
movpl <- ggplot(movies, aes(x=rating)) # only need x
movpl2 <- movpl + geom_histogram(binwidth = 0.1, aes(fill=..count..)) # Prints a histogram with ratings
movpl3 <- xlab('Movie Rating') + ylab('Count') # Labeling the x and y
print(movpl3 + ggtitle("Title"))

# Scatterplots
carpl <- ggplot(mtcars, aes(x=wt, y=mpg)) # DATA / AES
carpl <- carpl + geom_point(aes(size=hp)) # Bigger size depending on the hp

# Barplots - Categorical data
barpl <- ggplot(mpg, aes(x = class))
barplcolor <- barpl + geom_bar()# geom_bar specifies a barplot
barplcolor <- barpl+ geom_bar(aes(fill=drv), position = 'dodge') # Splits up positions

# Boxplot - Depicting data of numerical data
boxpl <- ggplot(mtcars, aes(x = factor(cyl), y = mpg))
boxplot <- boxpl + geom_boxplot()

# Two variable plots
twovpl <- ggplot(movies, aes(x = year, y = rating) + geom_bin2d())
twovpl <- twovpl + scale_fill_gradient(high = 'red', low = 'blue')
    # install.package('hexbin')
twovpl <- twovpl + geom_hex() / geom_density2d() # Gives a hex pattern

# Working with Coordinates and Faceting
# Coordinates - Resize the plots
# Faceting - Allows us to place more plots at the side of eachother
pl <- ggplot(mpg, aes(x = displ, y = hwy)) + geom_point()
# xlim / ylim takes vectors as arguments
pl + coord_cartesian(xlim = c(1,4), ylim = c(15, 30))
pl + coord_fixed(ratio = 1/3) # Resizes the plot
# creates multiple grids with facet_grid()
pl + facet_grid(. ~ cyl) # the . is the x axis, the cyl is the y axis

# Themes
theme_set(theme_minimal()) # Set global theme
pl <- ggplot(mtcars, aes(x = wt, y = mpg)) + geom_point()
pl + theme_dart()
# Install more themes
install.package('ggthemes')
library(ggthemes)


# Plotly - Interactive ggplots
'https://plot.ly/ggplot2'

install.packages('plotly')
library(ggplot2)
library(plotly)
gplo <- ggplot(mtcars, aes(mpg,wt)) + geom_point()
# pass in plot in ggplotly
gplot <- ggplotly(gplo)

# Any type of GGPLOT2 visualization
'http://ropensci.github.io/plotly-test-table/tables/0e3d5ca144d27d8416318824c1b6ec1421a51045/index.html'

