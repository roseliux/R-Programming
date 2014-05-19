#test: https://d396qusza40orc.cloudfront.net/rprog%2Fdoc%2Fpollutantmean-demo.html
pollutantmean <- function(directory, pollutant, id = 1:332) {
        ## 'directory' is a character vector of length 1 indicating
        ## the location of the CSV files
        setwd("/Users/Rocela/Desktop/github/R-Programming/Programming-Assignment1/specdata")
        ## 'pollutant' is a character vector of length 1 indicating
        ## the name of the pollutant for which we will calculate the
        ## mean; either "sulfate" or "nitrate".
        
        ## 'id' is an integer vector indicating the monitor ID numbers
        ## to be used
        f <- dir()
        ff <- f[id]
        data1 <- data.frame(Date=NA,sulfate=NA,nitrate=NA,ID=NA)[numeric(0),]
        for(fileName in ff){
                #print(f[i])
                data2 <- read.csv(fileName, header=T, sep=",")
                data1 <- rbind(data1, data2)
        }
        setwd("/Users/Rocela/Desktop/github/R-Programming/Programming-Assignment1")
        
        ## Return the mean of the pollutant across all monitors list
        ## in the 'id' vector (ignoring NA values)
        data.df <- data.frame(data1)
        data.sub <- subset(data.df, select = pollutant) # data.df[id,]
        #View(data.sub)
        m <- mean(data.sub[,pollutant],na.rm = TRUE)
        m
}
# pollutantmean("specdata", "sulfate", 1:10)
# pollutantmean("specdata", "nitrate", 70:72)
#pollutantmean("specdata", "nitrate", 23)