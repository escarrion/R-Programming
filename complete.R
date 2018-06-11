# return the number of complete observations in a set of csv files within a directory
# with each file containing readings for sulfate, nitrate, and the id of the recording station

complete <- function(directory , id = 1:332){
  #initialize the container frame 
  complete_frame <- data.frame(matrix(nrow = 0, ncol = 2))
  files <- list.files()
  
  for(i in id){
    frame <- read.csv(files[i])
    good <- complete.cases(frame)
    nobs <- nrow(frame[good, ])
    
    complete_frame <- rbind(complete_frame, c(i, nobs))    
  }
  names(complete_frame)<- c('id', 'nobs')
  complete_frame
}
