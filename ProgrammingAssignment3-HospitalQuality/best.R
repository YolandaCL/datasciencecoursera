## "outcome-of-care-measures.csv": 
## Contains information about 30-day mortality and readmission rates 
## for heart attacks, heart failure, and pneumonia for over 4,000 hospitals.

## Write a function called best that take two arguments: 
## the 2-character abbreviated name of a state and an outcome name. 
## The function reads the outcome-of-care-measures.csv file 
## and returns a character vector with the name of the hospital 
## that has the best (i.e. lowest) 30-day mortality for the specied outcome
## in that state. The hospital name is the name provided in the Hospital.Name variable. 
## The outcomes can be one of “heart attack”, “heart failure”, or “pneumonia”. 
## Hospitals that do not have data on a particular outcome should be excluded 
## from the set of hospitals when deciding the rankings.

outcome <- read.csv("outcome-of-care-measures.csv")
str(outcome)
## 'data.frame':   4706 obs. of  46 variables
## ...

best <- function(state, outcome) {
     ## Read outcome data
     outcome2 <- read.csv("outcome-of-care-measures.csv")
     ## Check that state and outcome are valid
     if (!(state %in% outcome2[,7])) stop("invalid state")
     ill <- switch(outcome, "heart attack"=11, "heart failure"=17, "pneumonia"=23, 0)
     if (ill == 0) stop("invalid outcome")
     ## Return hospital name in that state with lowest 30-day death rate
     range <- outcome2[outcome2[['State']]==state,]
     availrange <- range[range[,ill]!="Not Available",]
     thebest <- availrange[availrange[,ill]==min(as.numeric(as.character(availrange[,ill]))),]
     as.character(if(length(best)==46) thebest[['Hospital.Name']]
     else thebest[thebest[,2]==min(as.character(thebest[,2])),][[2]])
 }

## Sample run :
best("NY","heart attack")
##[1] "NYU HOSPITALS CENTER"




