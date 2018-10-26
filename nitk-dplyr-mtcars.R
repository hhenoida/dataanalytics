#analysis of dataset mtcars using dplyr
#filename : dplyr-mtcars.R

library(dplyr)
?mtcars
#Structure of Data set
str(mtcars) #structure
dim(mtcars) #dimensions
names(mtcars) ; colnames(mtcars)  #column names
rownames(mtcars) #rownames
summary(mtcars) #summary of dataset


#summary activities on mtcars
t1= table(mtcars$am)
pie(t1)
19/32 * 360
pie(t1, labels=c('Auto','Manual'))

t2= table(mtcars$gear)
pie(t2)
barplot(t2)
barplot(t2, col=1:3)
barplot(t2, col=1:3, horiz=T)
barplot(t2, col=c('green','blue','yellow'), xlab='Gear', ylab='No of cars', ylim=c(0,20))
title(main='Distributino of Gears of Cars', sub='No of Gears')

#using dplyr %>% is chaining function 
mtcars %>% select(mpg,gear) %>% slice(c(1:5, 10))
#select for columns, slice for rows
mtcars %>% arrange(mpg)   #ascending order of mileage
mtcars %>% arrange(am, desc(mpg)) %>% select(am, mpg) #ascending order of am, descending order of mpg
mtcars %>% mutate(rn= rownames(mtcars)) %>% select(rn, mpg)
#display rownames with mpg
mtcars %>% slice(c(1,5,7))
mtcars %>% sample_n(3)
mtcars %>% sample_frac(.2)
mtcars %>% select(sample(x=c(1:11), size=2))  %>% head

sample(x=1:11, size=2)

mtcars %>% mutate( newmpg = mpg * 1.1) 
mutate(mtcars, newmpg = mpg * 1.2)

# type of Tx, mean(mgp)
mtcars %>% group_by(am)  %>% summarise(MeanMPG = mean(mpg)) 
mtcars %>% group_by(am)  %>% summarise(MeanMPG = mean(mpg), MaxHP= max(hp), MinWT = min(wt)) 
mtcars %>% group_by(gear, cyl)  %>% summarise(MeanMPG = mean(mpg)) 
