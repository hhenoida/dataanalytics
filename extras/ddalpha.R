library(ddalpha)
data(baby)
baby   #Log Regression
head(baby)
#http://www.wisostat.uni-koeln.de/fileadmin/sites/statistik/Datenportal/data_descriptions/Baby.pdf

fit = glm(C ~ ., data=baby, family='binomial')
summary(fit)
fit = glm(C ~ X1 + X2, data=baby, family='binomial')
summary(fit)

ndata <- baby %>% sample_frac(.04)
(p=predict(fit, newdata = ndata, type='response'))
cbind(ndata, p, modelPredict = ifelse(p> .5,1,0))
fitted(fit)
sum1 = cbind(baby, fitted(fit), modelPredict = ifelse( fitted(fit) > .5,1,0))
table(sum1$C, sum1$modelPredict)
((53+136)/nrow(sum1))
