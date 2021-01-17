library(dplyr)
library(ggplot2)

data<-read.csv("~/Documents/Data.csv")

data$Age=ifelse(is.na(data$Age),ave(data$Age,FUN = function(x) mean(x,na.rm=TRUE)),data$Age)

data$Salary=ifelse(is.na(data$Salary),ave(data$Salary,FUN = function(x) mean(x,na.rm=TRUE)),data$Salary)

data$Country=factor(data$Country,levels=c("Spain","France","Germany"),labels=c(1,2,3))

mean(data$Salary)

pie(table(data$Country))
hist(data$Age)
barplot(table(data$Purchased))

cov(data$Age,data$Salary)
plot(density(data$Salary))

plot(data$Country)

ggplot(data,aes(x=data$Age,y=data$Salary))+geom_point()