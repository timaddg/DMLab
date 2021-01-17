library(randomForest)
library(party)
library(caret)

data<-iris

index=sample(2,nrow(data),replace=TRUE,p=c(0.7,0.3))
traindata=data[index==1,]
testdata=data[index==2,]

feature<-Species ~ Sepal.Length + Sepal.Width + Petal.Length + Petal.Width

output.forest<-randomForest(feature,data=traindata)
print(output.forest)
res1<-predict(output.forest,testdata)
confusionMatrix(res1,testdata$Species)
plot(output.forest)