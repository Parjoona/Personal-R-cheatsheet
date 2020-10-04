###############################################
# 1. select 25% states with the least murder  #
# By: Row position changed                    #
# By: Row position unchanged                  #
###############################################

# Import dataset
u <- USArrests

# sorterar USArrests i collumn 1 (murders) i ascending

# newu <- u[order(u[,1]),]
# newu[1:round(nrow(u) * 0.25), ]

# Shorthand of the one above
u[order(u[,1]),][1:round(nrow(u) * 0.25),]

###############################################
# Gives a procentage of the murder rates
quantile(u[,1])[2]
# Gives the murder rates under 4
u[which(u[,1] < quantile(u[,1])[2]),]

