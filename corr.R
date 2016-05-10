library(stats)
corr <- function(directory, threshold = 0)
  
{
  
  co <- c()
  
  df <- data.frame(id=character(), 
                   nobs=integer(), 
                   stringsAsFactors=FALSE) 
  
  for(i in 1:332)
  {
    fpath <- paste0(directory,formatC(i, width=3, flag="0"),".csv")
    
    p <- read.csv(fpath,header = TRUE)
    
    p.non.na <- p[!is.na(p[,c("nitrate")]) & !is.na(p[,c("sulfate")]),]

    if(nrow(p.non.na) > threshold)
    {
      
      co <- c(co,cor(p.non.na$nitrate,p.non.na$sulfate))
    }
  }
  
  round(  co, digits = 5)
    
}

cr <- corr("C:\\Users\\ragautam\\Downloads\\specdata\\", 150)
head(cr)

cr <- corr("C:\\Users\\ragautam\\Downloads\\specdata\\")                
cr <- sort(cr)                
set.seed(868)                
out <- round(cr[sample(length(cr), 5)], 4)
print(out)

cr <- corr("C:\\Users\\ragautam\\Downloads\\specdata\\", 129)                
cr <- sort(cr)                
n <- length(cr)                
set.seed(197)                
out <- c(n, round(cr[sample(n, 5)], 4))
print(out)


cr <- corr("C:\\Users\\ragautam\\Downloads\\specdata\\", 2000)                
n <- length(cr)                
cr <- corr("C:\\Users\\ragautam\\Downloads\\specdata\\", 1000)                
cr <- sort(cr)
print(c(n, round(cr, 4)))
