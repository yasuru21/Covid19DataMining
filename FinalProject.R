
require(caTools)
library(randomForest)

x = read.csv('/Users/zz/Desktop/corona_tested_individuals_ver_0083.english.csv',nrows = 5000)
x <- x[2:7]  #drop dates and columns that will not be used
x
colSums(is.na(x)) #checking for missing values
sample = sample.split(data$corona_result, SplitRatio = .75)
train = subset(x, sample == TRUE)
test  = subset(x, sample == FALSE)
summary(test)
str(train)
str(test)
rf <- randomForest(
  as.factor(corona_result) ~ .,
  data = train,
  na.action = na.exclude
)
print(rf)
pred = predict(rf, newdata=test[-6])
cm = table(test[,6],pred)
cm
importance(rf)
varImpPlot(rf)
