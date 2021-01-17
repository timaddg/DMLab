library(rJava)
library(rCBA)
library(ggplot2)
library(caret)
library(dplyr)
library(arulesViz)

data<-Groceries

train<-sapply(data,as.factor)
train<-data.frame(train,check.names = FALSE)
txns<-as(train,"transactions")
rules<-rCBA::fpgrowth(txns,maxLength=1,support = 0.03,confidence = 0.03,consequent = "Species")
inspect(rules)
plot(rules,method="graph")

