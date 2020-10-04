# Date objects in R

# https://www.statmethods.net/input/dates.html

x <- c("1jan1960", "2jan1960", "31mar1960", "30jul1960")
z <- as.Date(x, "%d%b%Y")
# gives 1-1-1960 etc
y <- as.Date(z, format="%d-%m-%Y")
# Gives 1960-01-01

# Using posix as date formater
posixx <- as.POSIXlt("2018-08-30")
# Using POSIX i can - or + dates and get the date between back