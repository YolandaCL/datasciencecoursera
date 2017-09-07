## "outcome-of-care-measures.csv": 
## Contains information about 30-day mortality and readmission rates 
## for heart attacks, heart failure, and pneumonia 
## for over 4,000 hospitals.
##
##  1 - Plot the 30-day mortality rates for heart attack 
##        > outcome <- read.csv("outcome-of-care-measures.csv", colClasses = "character") 
##        To make a simple histogram of the 30-day death rates from heart attack (column 11)
##        > outcome[, 11] <- as.numeric(outcome[, 11])
##        > hist(outcome[, 11])
##
##  2 - Finding the best hospital in a state 
##
##  3 - Ranking hospitals by outcome in a state 
##
##  4 - Ranking hospitals in all states 
 


