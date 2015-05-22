corr <- function(directory, threshold = 0) {
  ## 'directory' is a character vector of length 1 indicating
  ## the location of the CSV files
  
  ## 'threshold' is a numeric vector of length 1 indicating the
  ## number of completely observed observations (on all
  ## variables) required to compute the correlation between
  ## nitrate and sulfate; the default is 0
  
  dirf <- complete(directory)
  ids <-  dirf [ dirf ["nobs"] > threshold, ]$id
  corrValue <- numeric()
  
  for (i in ids) {
    
    newRead <- read.csv(paste(directory, "/", formatC(i, width = 3, flag = "0"), 
                             ".csv", sep = ""))
    dff <- newRead[complete.cases(newRead), ]
    corrValue <- c(corrValue, cor(dff$sulfate, dff$nitrate))
  }
  return(corrValue)
  
  
  ## Return a numeric vector of correlations
  ## NOTE: Do not round the result!
}