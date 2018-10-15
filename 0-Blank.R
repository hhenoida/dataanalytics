#Blank

library(car)
Boxplot(~income, data=Prestige, id=list(n=Inf)) # identify all outliers
Boxplot(mpg ~ cyl, data=df, id=list(labels=rownames(mtcars))) # identify all outliers
stripchart(mpg ~ factor(cyl), vertical = TRUE, data = mtcars, method = "jitter", add = TRUE, pch = 20, col = 'blue')



car::Boxplot(mpg ~ cyl, data=mtcars, id=list(labels=rownames(mtcars))) # identify all outliers

library(dplyr)
df <- mtcars %>% rownames_to_column()
car::Boxplot(mpg ~ cyl, data=df, id=list(n=Inf)) # identify all outliers
stripchart(mpg ~ cyl, vertical = TRUE, data = df, method = "jitter", add = TRUE, pch = 20, col = 'blue')

df[16,]


#http://felixfan.github.io/Boxplot/
easypackages::packages('sfsmisc', 'gplots','Rlab')
easypackages::libraries('sfsmisc', 'gplots','Rlab')
#The boxplot.matrix() function in the sfsmisc package draws a boxplot for each column (row) in a matrix.
?boxplot.matrix(mtcars, use.cols=T )
mtcars[Boxplot(mtcars),]
boxplot.data.frame(mtcars)
#The boxplot.n() function in the gplots package annotates each boxplot with its sample size.
boxplot2(mtcars)
#The ** bplot()** function in the Rlab package offers many more options controlling the positioning and labeling of boxes in the output.
bplot(mtcars)

library(ddalpha)
data()
