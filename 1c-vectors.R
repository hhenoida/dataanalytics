# Vectors and Basic Statistics

#create numbers in sequence----
(x1 = 10:19)

#subset/ filter values on condition, position----
x1[x1 > 15]
x1[x1 < 13]
x1[(x1 < 14) | (x1 > 17)]
x1[(x1 > 14) & (x1 < 17)]

x1[1]
x1[3:6]
x1[c(3,6,7)]
x1[-5]
x1[-c(1,3,7)]

#sort
sort(x1)
sort(x1, decreasing=T)
rev(x1)  #rev is different from decreasing order


#generate numbers different way----
(x2 = c(4,7,3,9,11))
#c - combine values in a vector variable

(x3 = seq(from=0, to=100, by=5))
(x4 = c(rep(4,times=3), rep(7, times=4)))
(x5 = c(rep(c(1,2,3), times=c(5,4,3))))

#Using probability Distributions
(x6 = rnorm(n=10, mean=5, sd=1))
(x7 = runif(n=10, min=2, max=10))

#removing decimal places/ round----
floor(10.35)
x6
floor(x6)
ceiling(x6)
trunc(x6)
round(x6,digits=2)  #round to decimal places
signif(x6,digits=2)  #round to specified no of digits

# Basic operations on vector----
x1
sum(x1)
cumsum(x1) # cumulative sum
x1 * 2  # multiple by 2
x1 * c(2,4) #multiple 2 & 4 alternatively
x1
#similarly other operators can be used
x1/2
x1 ^ 2
x1 ** 2
x1 %% 2
sqrt(x1)
sin(x1)

#concatenate vectors
(x8 = c(x1, x2))

#min max ----
min(x1)
max(x1)
mean(x1)
median(x1)
mode(x1) #this mode is not stats mode
length(x1)  #no of values
x1==x2
5 < 6
5 > 6
5 == 6

#attributes----
str(x1)
class(x1)
typeof(x1)
#methods(data.frame)
summary(x1)
head(x1)
tail(x1)


#missing values in vector (NA)----
(x9 = c(1,5,14,NA,20))
sum(x9)
is.na(x9)
sum(x9, na.rm=T)
na.omit(x9)
na.exclude(x9)

#Other Vectors
class(x1)
(x11 = c(10.4, 12.4, 15, 20)) #numeric
class(x11)
(x12 = c(3L,6L,9L, 15L)) #integer
class(x12)

#character
(x13 = c('henry', 'harvin', 'education'))
class(x13)
toupper(x13)
casefold(x13,upper=T)
(x14 = c("BUSINESS", "MARKETING", 'FINANCIAL'))
casefold(x14,upper=F)
?casefold
chartr("BMF","bmF",x14) #replace BMF with bmF
strsplit(x14, "E") #split at point E is found


#Logical Vectors
(x20 = c(TRUE, FALSE, T, F, TRUE))
class(x20)
sum(x20) #how many T
x20[x20 ==T ] # T=1
table(x20)  #T & F count

#names to vector elements
x14
names(x14) = c('CBAP','CMAP',"CFAP")
x14
x14["CMAP"]  #value of label CMAP


#paste 
paste("Product",1,sep="-")
paste("Coy",1,sep="$")
paste("Product",1:10,sep="-")

#Generate Sample values
(x25 = ceiling(rnorm(10, mean=60, sd=10)))
(x26a = sample(c("Male","Female")))
(x26b = sample(c("Male","Female"), size=10))
(x26c = sample(c("Male","Female"), size=10, replace=T))
table(x26c)
(x26d = sample(c("Male","Female"), size=10, replace=T, prob=c(.6, .4)))
table(x26d) #will not be exactly as per prob

(x26e = sample(c("Male","Female"), size=10000, replace=T, prob=c(.6, .4)))  #increase sample size
table(x26e) # approx as per prob
prop.table(table(x26e))

#using sampling with set.seed for repeating pattern
(x27a = sample(c("Phd","MBA", "BBA"), size=10, replace=T))
table(x27a)
(x27b = sample(c("Phd","MBA", "BBA"), size=10, replace=T))
table(x27b)
x27a==x27b  #not same

set.seed(123)  #123 can be any number
(x28a = sample(c("Phd","MBA", "BBA"), size=10, replace=T))
table(x28a)
set.seed(123)  #repeat this
(x28b = sample(c("Phd","MBA", "BBA"), size=10, replace=T))
table(x28b)
x28a==x28b  #all are same
