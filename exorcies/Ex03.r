# Randomly select 75% of the USArrest data as training data and the rest as testData
# Used to validate the created models.
u <- USArrests

trainingvec <- sample(1:nrow(u), 0.75*nrow(u))
testvec <- (1:nrow(u))[-trainingvec]
u[trainingvec,]