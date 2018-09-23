b <- read.csv('Batting.csv') # Batting

# Batting Average 
b$BA <- b$H / b$AB

# On-base percentage
b$OBP <- (b$H + b$BB + b$BHP) / (b$AB + b$BB + b$HBP + b$SF)

# Calculate singles
b$X1B <- b$H - b$X2B - b$X3B - b$HR

# Slugging Average
b$SLG <- ((1 * b$X1B) + (2 * b$X2B) + (3 * b$X3B) + (4 * b$HR)) / b$AB

# Filter away before the year 1985
b <- subset(b, yearID >= 1985)

s <- read.csv('Salaries.csv') # Salaries

# Merged datasets
m <- merge(b, s, by = c('playerID', 'yearID'))

# Get the lost players, all occcursions
lost_players <- subset(m, playerID %in% c('giambja01', 'damonjo01', 'saenzol01'))
lost_players <- subset(lost_players, yearID==2001)
lost_players <- lost_players[, c('playerID', 'H', 'X2B', 'X3B', 'HR', 'OBP', 'SLG', 'BA', 'AB')]
# Sort out players available
m <- subset(m, yearID == 2001)
# Visualize the persons 
ggplot(m, aes(x = OBP, y = salary)) + geom_point()
# Sorting away people who only hit once & remove AB >= 450
m <- subset(m, salary < 8000000 & OBP > 0)
m <- subset(m, AB >= 450)

library(dplyr) # Structurize it better
options <- head(arrange(m, desc(OBP)), 10)
options[, c('playerID','AB', 'salary', 'OBP')]

