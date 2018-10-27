#create vector of student names: divide into 2 groups
(studentname= paste('Student',1:33, sep='-'))
length(studentname)
.6 * length(studentname)
#group1 = 60% group2 = 40%
index = sample(length(studentname), size = .6 * length(studentname))
index
studentname[index]
length(studentname[index])
studentname[-index]

#


xy= studentname
length(xy)
(index = sample(x=length(xy), size=.6 * length(xy)))
length(index);train1 = xy[index]
test1 = xy[-index]; train1;test1

#create a large DF
sname = paste('S',1:1000,sep='-')
gender = sample(x=c('Male','Female'), size=1000, prob=c(.6,.4), replace=T)
marks = ceiling(rnorm(1000, 60,10))
df = data.frame(sname, gender, marks)
head(df)
table(df$gender)
length(df); nrow(df)
#split DF in to 2 parts 70% and 30%
#train - 70% of Df; test  - 30 % of df
index2 = sample(x=nrow(df), size= .7 * nrow(df))
index2
length(index2)
df[1:5,] ; df[c(1,5,7),]
train2 = df[index2,]
nrow(train2)
test2 = df[-index2, ]
nrow(test2)

#using caret
library(caret)
table(df$gender)
prop.table(table(df$gender))
(index3=createDataPartition(y=df$gender,p=0.7, list=F))
length(index3)
(train3 = df[index3,])
(test3= df[-index3,])
(t3a=table(train3$gender))
prop.table(t3a)
(t3b=table(test3$gender)) 
prop.table(t3b)
#proportion of am is almost same in both the samples
nrow(train2); nrow(test2)
(cb = cbind(table(train2$gender), table(test2$gender)))
prop.table(cb, 1)
122/299; 285/701 # proportion of Females in both partitions
prop.table(cb, 2)



#factors
(gender = sample(c('M','F'), size=20, replace=T))
summary(gender)
genderF = factor(gender)
summary(genderF)
genderF

(likscale = sample(c('Ex','Good','Sat','Poor'), size=20,replace=T))
summary(likscale)
class(likscale)
likscaleF = factor(likscale)
summary(likscaleF)
class(likscaleF)
likscaleOF = factor(likscale, ordered=T, levels=c('Poor', 'Sat', 'Good','Ex'))
summary(likscaleOF)
likscaleOF
barplot(table(likscaleF), col=1:4)
barplot(table(likscaleOF), col=1:4)




names(mtcars)
cyl, gear, am, vs
table(mtcars$cyl, mtcars$gear, mtcars$carb)
xtabs( ~ cyl + gear + carb, data= mtcars)
