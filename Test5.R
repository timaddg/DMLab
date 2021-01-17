library(party)
library(caret)
library(ggplot2)
library(rpart)
library(rpart.plot)
library(e1071)

data<-iris
feature<-Species ~ Sepal.Length + Sepal.Width + Petal.Length + Petal.Width

index<-sample(2,nrow(data),replace=TRUE,p=c(0.7,0.3))
traindata<-data[index==1,]
testdata<-data[index==2,]

tree1<-rpart(feature,traindata,method="class")
rpart.plot(tree1)

tree2<-ctree(feature,traindata)
plot(tree2)

res1<-predict(tree2,testdata)
confusionMatrix(res1,testdata$Species)


mode1<-naiveBayes(feature,traindata)
print(mode1)
res2<-predict(mode1,testdata)
confusionMatrix(res2,testdata$Species)
