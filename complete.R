complete <- function(directory, id = 1:332)
  
{
  

  df <- data.frame(id=character(), 
                   nobs=integer(), 
                   stringsAsFactors=FALSE) 
   
  for(i in id)
  {
    fpath <- paste0(directory,formatC(i, width=3, flag="0"),".csv")

    p <- read.csv(fpath,header = TRUE)

    p.non.na <- p[!is.na(p[,c("sulfate")]) & !is.na(p[,c("nitrate")]),]
    
    df<- rbind(df,c(i,nrow(p.non.na)))
  }

  names(df) <- c("id","nobs")
  
df
  
}


cc <- complete("C:\\Users\\ragautam\\Downloads\\specdata\\",c(6, 10, 20, 34, 100, 200, 310))
print(cc$nobs)
cc <- complete("C:\\Users\\ragautam\\Downloads\\specdata\\",54)
print(cc$nobs)

set.seed(42)
cc <- complete("C:\\Users\\ragautam\\Downloads\\specdata\\", 332:1)
use <- sample(332, 10)
print(cc[use, "nobs"])


