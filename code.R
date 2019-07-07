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
g<-g + geom_histogram(color="black",fill="white", bins=30)
g<-g + geom_vline(aes(xintercept=mean(data)),
                  color="blue",linetype="dashed",size=1)
g<-g + theme(axis.text.x=element_text(size=12, color="#0000ff")) 
g<-g+ scale_x_continuous(breaks=c(3:8))
g<-g+labs(title="Sample Distribution with Mean", x="Value",y="Count")
print(g)

g2<-ggplot(data, aes(x=data))
g2<-g2 + geom_histogram(aes(y=..density..),color="black")
#g2<- g2 + stat_function(fun=dnorm, args = list(mean=mean(data), sd=sd(data)), color="red")
g2<-g2+stat_function(fun = dnorm, args = list(mean = mean(data), sd = sd(data)), color = "gold1", size = 1.0)
print(g2)