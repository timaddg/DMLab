library(arules)
library(arulesViz)

data<-Groceries



rules<-apriori(data=data,parameter = list(minlen=2,maxlen=10,support=0.02,confidence=0.3))

inspect(sort(rules,by='lift')[0:10])
plot(rules,method="graph")