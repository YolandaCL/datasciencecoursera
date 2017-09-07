## "outcome-of-care-measures.csv": 
## Contains information about 30-day mortality and readmission rates 
## for heart attacks, heart failure, and pneumonia 
## for over 4,000 hospitals.
##
## < 1 > 
## - Plot the 30-day mortality rates for heart attack :
## outcome <- read.csv("outcome-of-care-measures.csv", colClasses = "character") 
## To make a simple histogram of the 30-day death rates from heart attack (column 11)
## outcome[, 11] <- as.numeric(outcome[, 11]) 
##
## < 2 > 
## - Finding the best hospital in a state 
## Write a function called "best" that take two arguments :
## the 2-character abbreviated name of a state and an outcome name. 
## The function reads the outcome-of-care-measures.csv file 
## and returns a character vector with the name of the hospital 
## that has the best (i.e. lowest) 30-day mortality for the specied 
## outcome in that state. The hospital name is the name provided in the Hospital.
## Name variable. 
## The outcomes can be one of “heart attack”, “heart failure”, or “pneumonia”. 
## Hospitals that do not have data on a particular outcome should be excluded 
## from the set of hospitals when deciding the rankings.
##
## < 3 >
## - Ranking hospitals by outcome in a state 
## Write a function called "rankhospital" that takes three arguments :
## the 2-character abbreviated name of a state (state), an outcome (outcome), 
## and the ranking of a hospital in that state for that outcome (num). 
## The function reads the outcome-of-care-measures.csv file 
## and returns a character vector with the name of the hospital 
## that has the ranking specied by the num argument. 
##
## < 4 >
## - Ranking hospitals in all states
## Write a function called rankall that takes two arguments: 
## an outcome name (outcome) and a hospital ranking (num). 
## The function reads the outcome-of-care-measures.
## csv  file and returns a 2-column data frame containing 
## the hospital in each state that has the ranking specied in num. 
## For example the function call rankall("heart attack", "best") 
## would return a data frame containing the names of the hospitals 
## that are the best in their respective states for 
## 30-day heart attack death rates. 
## The function should return a value for every state (some may be NA). 
## The first column in the data frame is named hospital, which contains the hospital name,
## and the second column is named state, which contains the 2-character abbreviation 
## for the state name. 
## Hospitals that do not have data on a particular outcome 
## should be excluded from the set of hospitals when deciding the rankings.

