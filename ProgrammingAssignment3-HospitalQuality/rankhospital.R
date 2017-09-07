outcome <- read.csv("outcome-of-care-measures.csv")
str(outcome)
## 'data.frame':   4706 obs. of  46 variables
## ...

rankhospital <- function(state, outcome, num = "best") {
        ## Read outcome data
        outcome2 <- read.csv("outcome-of-care-measures.csv")

        ## Check that state and outcome are valid
	      ## $ State:  outcome2[, 7]
        states <- levels(outcome2[, 7])[outcome2[, 7]]
        state_flag <- FALSE
        for (i in 1:length(states)) {
                if (state == states[i]) {
                        state_flag <- TRUE
                }
        }
        if (!state_flag) {
                stop ("invalid state")
        } 
        if (!((outcome == "heart attack") | (outcome == "heart failure")
              | (outcome == "pneumonia"))) {
                stop ("invalid outcome")
        }

        ## Return hospital name in that state with the given rank 30-day death rate
        col <- if (outcome == "heart attack") {
                11
        } else if (outcome == "heart failure") {
                17
        } else {
                23
        }

        ## $ Hospital.Name:  outcome2[, 2]
	      ## $ State:  outcome2[, 7]
        outcome2[, col] <- suppressWarnings(as.numeric(levels(outcome2[, col])[outcome2[, col]]))
        outcome2[, 2] <- as.character(outcome2[, 2])
        stateOutcome2 <- outcome2[grep(state, outcome2$State), ]
        orderOutcome2 <- stateOutcome2[order(stateOutcome2[, col], stateOutcome2[, 2], na.last = NA), ]
        if(num == "best") {
                orderOutcome2[1, 2]
        } else if(num == "worst") {
                orderOutcome2[nrow(orderOutcome2), 2]
        } else{
                orderOutcome2[num, 2]
        }
}


## Sample run :
rankhospital("MD", "heart failure", 5)
## [1] "SAINT AGNES HOSPITAL"
