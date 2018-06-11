# get the correlation between two pollutant levels across monitors
# using threshold as a filter for the number of complete observations
# end by save correlations to a vector

corr <- function(directory, threshold = 0){
    # get monitor stations above threshold
    complete <- complete(directory)
    over <- subset(complete, nobs > threshold)
    
    if(threshold > max(complete[,2])){
        empty <- c(0)
        empty
    } 
    files <- list.files(directory)
    corr_vector <- vector('numeric')
    for(i in 1:nrow(over)){
        frame <- read.csv(files[over[i,1]])
        good <- complete.cases(frame)
        goodframe <- frame[good, ]
        correlation <- with(goodframe, cor(sulfate,nitrate))
        corr_vector <- append(corr_vector, correlation)
    }
    corr_vector 
}

