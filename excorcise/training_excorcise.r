library(ggplot2)
# Create a histogram with mpg
mpgpl <- ggplot(mpg, aes(x = hwy)) 
mpgpl <- mpgpl + geom_histogram(fill = 'red', alpha = 0.5, bins = 20)

# Create barplot by manufactorer
barpl <- ggplot(mpg, aes(x = manufacturer))
barpl <- barpl + geom_bar(aes(fill = factor(cyl)))

# Create a scatterplot volume / sales
scatterpl <- ggplot(txhousing, aes(x = sales, y = volume))
scatterpl <- scatterpl + geom_point(colot = 'blue', alpha = 0.3)
# Create a line through the scatterplot
scatterpl <- scatterpl + geom_smooth(color='red')