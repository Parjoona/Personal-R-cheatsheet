# 1. Get states with more then 75% urban population and the rape var over 20.
# 2. Get states where urban population is over 75% or rape is over 20
# Import dataset
u <- USArrests

# urbanandrape <- urban[any(urban[,4] > 20)]
ex1 <- u[which(u[,3] > 75 & any(u[,3] > 20)), ]

ex2 <- u[which(u[,4] > 75 | u[,4] > 20), ]