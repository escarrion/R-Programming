# calculate the average pollutant levels across different monitors
# given a vector of monitor ids

pollutantmean <- function(directory, pollutant, id =1:332){
  all_monitors <- data.frame(matrix(nrow = 0, ncol = 4))
  names(all_monitors) <- c('Date', 'sulfate', 'nitrate', 'id')
  
  setwd(directory)
  
  files <- list.files(directory)
  for(i in id){
    g <- read.csv(files[i])
    all_monitors <- rbind(all_monitors, g)
  }
  mean(all_monitors[[pollutant]], na.rm = TRUE)
}
