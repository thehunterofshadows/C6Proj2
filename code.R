# Load the required libraries

library(R.utils)
library(data.table)
library(dplyr)
library(lubridate)
library(ggplot2)


#Create the simultion

rate<-0.2
n<-40
intervals<-1000
data = NULL
for (i in 1 : intervals) data = c(data, mean(rexp(n,rate)))
data<-data.table(data)
g<-ggplot(data, aes(x=data)) 
g<-g + geom_histogram(color="black",fill="white")
g<-g + geom_vline(aes(xintercept=mean(data)),
                  color="red",linetype="dashed",size=1)
print(g)