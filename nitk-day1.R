#data analysis using package dplyr

df1
library(dplyr)
#install.packages(dplyr)

df1 %>% group_by(gender)  %>% summarise(mean(marks), mean(marks2))
df1 %>% group_by(gender)  %>% summarise(max(marks), min(marks2))
df1 %>% group_by(course, gender)  %>% summarise(mean(marks), mean(marks2))
df1 %>% group_by(course, gender) %>% count




set.seed(1234)
(gender = sample(c('M','F'), size=30,replace=T, prob=c(.7, .3)))
table(gender)
prop.table(table(gender))

(balls = c('Red','Blue','Red','Green'))
sample(balls, size=1)

(x= rnorm(100, mean=60, sd=10))
summary(x) #summary of x
quantile(x) # quantile
quantile(x, seq(0,1,.1)) # decile
quantile(x, seq(0,1,.01)) #percentile
fivenum(x)
boxplot(x)
abline(h=fivenum(x))
stem(x)
hist(x)


plot(density(x))
abline(v=60, col='red')
floor(3.4)
floor(x)
floor(3.7)
ceiling(3.4)
ceiling(x)
ceiling(3.7)
trunc(3.4)
round(3.456, 2)
signif(3.567334, 3)
