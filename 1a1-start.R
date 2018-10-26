#Starting to work in R

# assign----
x1 = 3
x2 <- 3
#Print Values
x1
x2
#Assign and Print
(x3=3)
#environment----
#variables in env
ls()
# datasets available for use
data()
women
?women
?mtcars
mtcars
mtcars$mpg
attach(mtcars)
mpg
# libraries currently loaded
library()
#Elements
ls()
rm(list=ls())
rm(list = ls(all = TRUE))
x1
women
mtcars
data(mtcars)

#help
?mean
x <- c(0:10, 50)
x
print(x)
xm <- mean(x)
xm
c(xm, mean(x, trim = 0.10))
help(mean)

#Create Values
1:100
seq(0,100, by=2)
seq(1,100, by=2)
seq(1,10, length.out=5)
rep(1,5)
rep(c(1,4), times=4)
rep(c(1,4), each=4)
rep(c(1,4), times = c(2,6))

(x = c(0:10, 50:100))
x
#Function on data
xm = mean(x)
xm
#version of R
version
# todays date
Sys.Date()
# working directory
getwd()
#methods available for a class of object
methods(class='matrix')
#basic command to plot
plot(1:10)
#Clean Console by
#Take cursor to Console pane & press Control + L

#run all commands in the Source File test1.R
#first create a R file with some content in current dir
source('test1.R')
