## 4 - Ranking hospitals in all states
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


rankall <- function(outcome, num = "best") {
        ## Read outcome data
        ## Check that state and outcome are valid
        ## For each state, find the hospital of the given rank
        ## Return a data frame with the hospital names and the
        ## (abbreviated) state name
        
        #read in the desired data
        outcome2 <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
        
        #create a list of states and initialize a character array to hold the
        #required hospital names
        state <- levels(factor(outcome2[, 7]))
        hospital <- vector(mode="character") 
        
        for (i in seq(state)) {
                hospital[i] <- rankhospital(state[i], outcome, num)
        }
        data.frame(hospital, state)
}


## 1º Sample run :
head(rankall("heart attack", 20), 3)
##				hospital state
## 1       		    	    <NA>    AK
## 2      D W MCMILLAN MEMORIAL HOSPITAL    AL
## 3   ARKANSAS METHODIST MEDICAL CENTER    AR

## 2º Sample run :
 head(rankall("heart attack", "best"))
##				 hospital state
## 1     PROVIDENCE ALASKA MEDICAL CENTER    AK
## 2             CRESTWOOD MEDICAL CENTER    AL
## 3              ARKANSAS HEART HOSPITAL    AR
## 4                 MAYO CLINIC HOSPITAL    AZ
## 5    GLENDALE ADVENTIST MEDICAL CENTER    CA
## 6 ST MARYS HOSPITAL AND MEDICAL CENTER    CO
