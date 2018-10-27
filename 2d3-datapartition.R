#partition the data into train and test set
mtcars
nrow(mtcars)
index = sample(x=1:nrow(mtcars), size=.7 * nrow(mtcars))
index
(train= mtcars[index,])
(test= mtcars[-index,])
nrow(train) ; nrow(test)
nrow(train) + nrow(test)

#another method used for Logistic / Decision Tree
library(caret)
#create a large DF
sname = paste('S',1:1000,sep='-')
gender = sample(x=c('Male','Female'), size=1000, prob=c(.6,.4), replace=T)
marks = ceiling(rnorm(1000, 60,10))
df = data.frame(sname, gender, marks)
head(df)
table(df$gender)
#split DF in to 2 part with equal proportion of M & F


set.seed(123)
(index2=createDataPartition(y=df$gender,p=0.7, list=F))
(train2 = df[index2,])
(test2 = df[-index2,])
table(train2$gender); prop.table(table(train2$gender))
table(test2$gender) ; prop.table(table(test2$gender))
#proportion of am is almost same in both the samples
nrow(train2); nrow(test2)
(cb = cbind(table(train2$gender), table(test2$gender)))
prop.table(cb, 1)
122/299; 285/701 # proportion of Females in both partitions
prop.table(cb, 2)


#now do LM
library(olsrr)
fit = lm(mpg ~ disp + hp + wt + qsec, data = train)
k = ols_step_all_possible(fit)
plot(k)
k
summary(lm(mpg ~ wt, data= train))
summary(lm(mpg ~ wt + hp, data= train))

library(gvlma)
gvmodel = gvlma(finalmodel)
gvmodel

finalmodel = lm(mpg ~ wt + hp, data= train)
(predictedvalues = predict(finalmodel, ndata=test))
cbind(test$mpg, predictedvalues)
