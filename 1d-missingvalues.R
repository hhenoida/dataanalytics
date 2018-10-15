# Missing Values
# Create, Detect, Replace, Remove, Impute, Visualise
# 
library(VIM); library(mice)
(v1 = c(1,2,NA,NA,5))

is.na(v1)
v1=NULL
v1  # remove all values
(v1 = c(1,2,NA,NA,5,6,7,NA))
is.na(v1)
sum(is.na(v1))  # sum TRUE values ie missing values
mean(v1)  # cannot calculate if NA values in vector
mean(v1, na.rm=T)  # remove and calc
(v1a = na.omit(v1))  # omit missing values and put in new vector
v1a
mean(v1a)
sum(v1a) # now you can sum on non NA values
sum(v1, na.rm=T)

anyNA(v1) # is there any NA value
anyNA(v1a)

#impute missing values of vector with mean value of non NA values
v1
mean(v1, na.rm=T)  # this value to be used
v1[is.na(v1)]
v1[is.na(v1)] = mean(v1, na.rm=T)
v1
anyNA(v1)

#NA value in a DF
#Use VIM package to load sleep dataset with NA values in rows & col
library(VIM)
data(sleep, package='VIM')
summary(sleep)# see NA values in cols
str(sleep)
head(sleep)
dim(sleep)
complete.cases(sleep) #all complete rows without any missing values
sum(complete.cases(sleep)) # count non NA rows/ complete 42
sum(!complete.cases(sleep))  #count NA rows 20
mean(complete.cases(sleep))  #42/62
# total cases = 62, complete=42  

sleep[complete.cases(sleep),] # list rows which are complete
sleep[!complete.cases(sleep),] # list rows which have NA values

# Particular Column
is.na(sleep$Dream)
sum(is.na(sleep$Dream))
mean(is.na(sleep$Dream))  # 12/62

# How many missing values
sum(is.na(sleep))  #total in data frame
names(sleep)# check columname
str(sleep)
colSums(is.na(sleep))  #NA values in each column
rowSums(is.na(sleep))  #NA values in each row
head(sleep)
as.data.table(sleep)  #data.table format
is.na(sleep[1:3,]) # first 3 rows
head(sleep,n=3)

#Tabulate
library(mice)
mice::md.pattern(sleep)
#42 rows without any missing values # 2 rows with 1 NA NonD


# explore more