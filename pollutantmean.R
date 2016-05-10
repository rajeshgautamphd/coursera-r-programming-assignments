pollutantmean <- function(directory, pollutant, id = 1:332)
{
  subtotal <- 0
  totalcount <- 0
  fpath <- "junk"
  for(i in id)
  {
    fpath <- paste0(directory,formatC(i, width=3, flag="0"),".csv")
    #fpath -> as.character(paste0("C:\\Users\\ragautam\\Downloads\\specdata\\",as.character(i),".csv"))
    #print(fpath)
    p <- read.csv(fpath,header = TRUE)
    p.non.na <- p[!is.na(p[,c(pollutant)]),]
    totalcount <- totalcount + nrow(p.non.na)
    subtotal <- subtotal + sum(p.non.na[,c(pollutant)],na.rm = TRUE)
  }
  #print(length(id))
  round(  (subtotal / totalcount), digits = 3)
}



pollutantmean("C:\\Users\\ragautam\\Downloads\\specdata\\", "sulfate", 1:10)
pollutantmean("C:\\Users\\ragautam\\Downloads\\specdata\\", "nitrate", 70:72)
pollutantmean("C:\\Users\\ragautam\\Downloads\\specdata\\", "sulfate", 34)
pollutantmean("C:\\Users\\ragautam\\Downloads\\specdata\\", "nitrate")


