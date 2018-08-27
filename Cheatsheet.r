# Used packages in this course
# pipe operator
pipeoperator <- "MAGRITTR" 
# Package for data wrangling and manipulation 
wrangler <- "DPLYR" 

# numeric / integer
a <- 2.1232
b <- 3
# true / false
tr <- TRUE
fa <- FALSE
# String
str <- "String"

# Check which objects exist in list
flist <- factor(c("male", "female", "male", "female", "male", "male"))
# returns which objects in the list
levels(flist)
# returns how many objects in the list
nlevels(flist)

# [1] Tells the first value when printing
# This is a vector
vtor <- 1:30
vtor[5] # index in a vector

# length() returns the length in a vector
length(flist)             # will return 6

# c() returns a concatenated version of the list, string or number
# This is how you concatenate from a vector
vtor[c(5, 25, 19)]

# nchar returns number of chars
nchar(wrangler)   # From the string "DPLYR"

# Modulus trough vector
vtor[vtor %% 2 == 0]
# Checks out if its TRUE or FALSE
vtor %% 2 == 0

# using key:values on a vector
ve <- c("a" = 1, "b" = 2, "c" = 3)
names(ve) # using name to take out using the key

# length out devides out numbers between how many you want
numbered <- seq(1, 10, length.out = 2)
numeri <- seq(1,8,2)
cr <- seq(5, by = 5, length = 75)

# Change or get the directory log files gets pushed to.
#setwd("") / getwd("")

# Repeats 5, 5 times
re <- rep(5, 5)
# Repeat vector
repve <- rep(1:3, 3) 
repve <- rep(1:3, each = 3, times = 2)
rere <- rep(1:3, 1:3)

# Random numbers
ran <- runif(2) # creates 2 random numbers
randomnums <- round(runif(2) * 100)

# Check for missing values
vtor[3] <- NA
!is.na(vtor) # Gives vactor values TRUE if missing

# Cleaning from missing values 
replacevtor <- vtor[!is.na(vtor)] # Use this if possible
replacevtor <- na.omit(vtor) # Does the same thing as above

# Find min and max values
minmax <- c(1:15)
max(minmax)
min(minmax)
median(minmax)

# Check which is bigger then 5
which(minmax > 5)
# Checking the min in the minmax vector
minmax[which(replacevtor == min(replacevtor))]

# Convert between types
cert <- c(1,2,3,4,5,6,7,7,13,35,315)
as.numeric(cert)
as.character(cert)
as.integer(cert)

# Prio
# Character > Numeric > Integer > Logical (boolean)
thelist <- list(cert, vtor)
unlist(thelist)

# Check if something contains
vecone <- c(1:20)
vectwo <- c(5:25)
# Check if numb 1 is in the vecone
1 %in% vecone
vecone %in% vectwo
is.element(a, b) # same as above

# Sample mixes up the result from vector
sample(vecone) # Use replace = FALSE, to not replace a value
set.seed(10) # Sets the sample to same as when called earlier 

# Sorting
sort(vecone) # can add decreasing = FALSE/TRUE
rev(sort(vecone)) # Order decreasing
order(vecone) # Order Ascending

union(vecone, vectwo) # Concats two vectors, without duplicates
intersect(vecone, vectwo) # Gives the elements that is similar

# if condition
any(vecone > 10) # normal if
all(vecone < 30) # checks if all numbers is less then 30

if (vecone[1] > vectwo[1]) {
    print("Yes its bigger")
} else {
    print("No its not")
}

ifelse(vecone[1] > vectwo, print("One"), print("Two"))

# For loops
for (i in c(1:10)) {
    if (i %% 2) {
        print(i)
    }   
}

# Dataframes
dataA <- c(1, 25, 62, NA, 23)
dataB <- c(NA, 23, 43, 1 , 4)
dataC <- c(13, 23, 4, NA, 3)
dataD <- c(32, 43, 2, 11, NA)
dataE <- c(7, 33, NA, 11, 4)

dataFrame <- data.frame(dataA, dataB, dataC, dataD, dataE) # Gives a matrix back
stack(dataFrame) # Stacking with data in each collumn
unstack(stack(dataFrame)) # Undo stacking of collum
cbind(dataFrame, dataFrame, dataFrame) # collumn arrange the dataframes
rbind(dataFrame, dataFrame, dataFrame) # row arrange the dataframes

# Creates a GUI imput for data management on data frames
# fix(dataFrame)

# Transpose
t(dataFrame) # composes a matrix instead of data frame
as.data.frame(dataFrame) # converts back to a data frame
head(dataFrame) # shows the first 6 rows, can add more with a ", 10"
tail(dataFrame) # shows the last 6 rows, same as above but reverse

# Remove missing values
na.omit(dataFrame)

# returns anything that has a value over 1
# $ takes specific row out dataFrame
dataFrame[which(dataFrame$dataA > 1), ] # will remove 1 and NA

# Not recommended to use this beneath
# Binds the dataFrame variables vector names
# attach(dataFrame)

# Simulates numbers with a mean of 6 (aka 2 - 11) 
set.seed(100)
ranvect <- rpois(100, 6)
# Checks from which number it starts from and ends on
range(ranvect) 
# Takes break-points between vectors
cut(ranvect, range(ranvect)[1]:range(ranvect)[2])
# Does the same as above, but prettier
cut(ranvect, pretty(ranvect))

# Takes a file.csv and uses the all the rows in the 3rd collumn
table(USArrests[,3])
# Use this to take selected values in the 3rd collumn
# Add the 5 in the end to choose how many ranges you want
table(cut(USArrests[,3], pretty(USArrests[,3], 5)))
# Put variables towards eachother
table(USArrests[,3], USArrests[,2])
table(airquality[,4], airquality[,5])
# Making it *readable* and put into probilityvar
probabilityvar <- table(cut(airquality[,4], pretty(airquality[,4])), airquality[,5])
# Using prop.table you can can estimate the chance for the certain temperature
# Adding secound argument 1 or two will add the row | collumn to be 1 in total (percentage chance)
prop.table(probabilityvar, 1)
# Using subsets to find specific days
subset(dataFrame, subset = dataFrame == NA)

# Setting out working directory to R in documents
setwd("C:\\Users\\Pauma\\Documents\\R\\Cheatsheet")
# Opens content from txt file, removes header in file
fileOne <- read.table("http://rstatistics.net/wp-content/uploads/2015/07/exported_pipe.txt", header = F)
# Writes a new file, in csv format, and remove row numbers with row.names = FALSE
write.csv(fileOne, "exported_pipe.csv", row.names = F)
# Fill fils up missing values, header looks at first row as names or not
fileTwo <- read.table("bbc.txt", fill = T, header = F)
write.csv(fileTwo, "bbc.csv", row.names = F, sep = "\t") # separator can be \n or \t, e.x
# Alternative to reading files
# read.table("clipboard") # Takes what you copy paste functionality

# colClasses automaticly format lists, nrow returns specified amount of rows
# skip = skips chosen lines
sampletxt <- read.table("sample.txt", fill = T , header = F, colClasses = c("character", "character", "character", "character"), nrow = 10)

# how to import
library(datasets) # Can write help = {specific dataset} ### ?USArrests gives information about datasets
summary(USArrests) # Gives summary
# Short summary, with the use of all datasets
fivenum(USArrests) # Minimum, Low hinge, Median, Upper Hinge, Maximum

# Gives back the structure of the dataset
str(USArrests)
# Returns the collumn names 
colnames(USArrests) # Can be used to update
# Returns the row names
rownames(USArrests)
# First number is row number, Second is collumn number
USArrests[1, 1]

# Functions in R
fun.mean <- function(x) {
    prod.x <- prod(x)
    n <- length(x)
    gm <- prod.x^(1/n)
    return(gm)
}

# Matrix
goog <- c(450, 451, 452, 455, 465)
msft <- c(231, 233, 254, 234, 233)

stocks <- c(goog, msft)

# Creates 2 dimensional matrix
stock.matrix <- matrix(stocks, byrow=T, nrow=2)
days <- c('Mon', 'Tue', 'Wed', 'Thu', 'Fri')
st.names <- c('Google', 'Microsoft')

# Setting column name for days
colnames(stock.matrix) <- days
# Setting row name for stock names
rownames(stock.matrix) <- st.names

# Combines column values
colSums(stock.matrix)
# Combines each row values
rowSums(stock.matrix)

# Counts the mean for matrix
rowMeans(stock.matrix)

# Bind together new stocks to matrix
fb <- c(111,112,113,115,119)
tech.stocks <- rbind(stock.matrix, fb)
tech.average <- rowMeans(tech.stock)
# Bidning together stocks
tech.stocks <- cbind(tech.stocks, tech.average)

# Linear multiplication matrix mathmatics
matri <- matrix(1:25, byrow=T, nrow=5)
linear <- matri %*% matri