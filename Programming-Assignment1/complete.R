## 'directory' is a character vector of length 1 indicating
## the location of the CSV files
# setwd("/Users/Rocela/Desktop/github/R-Programming/Programming-Assignment1/specdata")

## 'id' is an integer vector indicating the monitor ID numbers
## to be used

## Return a data frame of the form:
## id nobs
## 1  117
## 2  1041
## ...
## where 'id' is the monitor ID number and 'nobs' is the
## number of complete cases
# test: https://d396qusza40orc.cloudfront.net/rprog%2Fdoc%2Fcomplete-demo.html
complete <- function(directory, id = 1:332) {
        setwd("/Users/Rocela/Desktop/github/R-Programming/Programming-Assignment1/")
        
        ids<-vector()
        numcomplete<-vector()
        
        doshit<-function(i) {
                if(i<10) {
                        fp<-paste("specdata/00",as.character(i),".csv",sep="")
                }
                else if(i<100) {
                        fp<-paste("specdata/0",as.character(i),".csv",sep="")
                }
                else {
                        fp<-paste("specdata/",as.character(i),".csv",sep="")
                }  
                
                data <- read.csv(fp, header=T)
                data <- data[complete.cases(data),]
                
                return(c(i,nrow(data)))
                
        }
        
        results<-sapply(id,doshit)
        
        df<-as.data.frame(t(results))
        names(df)[1] <- "id"
        names(df)[2] <- "nobs"
        df
}