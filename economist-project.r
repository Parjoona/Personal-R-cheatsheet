library(ggplot2)
library(data.table) # for fread()
library(ggthemes) # Themes

# Used to label the countries
pointsToLabel <- c("Russia", "Venezuela", "Iraq", "Myanmar", "Sudan",
                   "Afghanistan", "Congo", "Greece", "Argentina", "Brazil",
                   "India", "Italy", "China", "South Africa", "Spane",
                   "Botswana", "Cape Verde", "Bhutan", "Rwanda", "France",
                   "United States", "Germany", "Britain", "Barbados", "Norway", "Japan",
                   "New Zealand", "Singapore")

# Reads the document, drop = 1 skips the first column
d <- fread('economist-project-data.csv', drop = 1) 

# Create the scatterplot
plot <- ggplot(d, aes(x = CPI, y = HDI, color = Region))
# Create circles
plot <- plot + geom_point(size = 4, shape = 1)
# Creates a line through data
# se = F removes the gray area around the line
# method = 'lm' means linear modeling
plot <- plot + geom_smooth(aes(group = 1), method = 'lm', formula = y~log(x), se = F, color = 'red') # Linear regression
# Add text to the circles
plot <- plot + geom_text(aes(label = Country), color = 'gray20', data = subset(d, Country %in% pointsToLabel), check_overlap = T)
plot <- plot + scale_x_continous(limits = c(.9, 10.5), breaks = 1:10)
plot <- plot + theme_economist_white() # theme to mimic the economist