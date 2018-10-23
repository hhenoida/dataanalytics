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
data(women)
attach(mtcars)
mgp
# libraries currently loaded
library()
Elements
ls()
rm(list=ls())
rm(list = ls(all = TRUE))
#help
?mean
help(mean)
#Create Values
1:10000000
x = c(0:10, 50)
x
#Function on data
xm = mean(x)
xm
#version of R
version()
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
