library(dendextend)
library(party)
library(caret)
library(cluster)

data<-read.csv("~/Documents/Mall_Customers.csv")
X=data[4:5]
kmeans.re<-kmeans(X,centers=3,nstart = 20)
kmeans.re$cluster

cm<-table(data$Genre,kmeans.re$cluster)
cm

plot(X[c(1,2)],col=kmeans.re$cluster,main="cluster")

hc=hclust(dist(X,method='euclidean'),method='ward.D')
y_hc=cutree(hc,4)

dendrogram<-hclust(dist(X,method='euclidean'),method='ward.D')
plot(dendrogram)

plot(X[c(1,2)],col=y_hc,main="hclust")

