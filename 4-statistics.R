#statistical concepts (Measures of centrality, Central limit theorem, Confidence intervals, Hypothesis testing, ANOVA, Correlation, Covariance)


#CLT-----
#The CLT says that if you take many repeated samples from a population, and calculate the averages or sum of each one, the collection of those averages will be normally distributed… and it doesn’t matter what the shape of the source distribution is!
#https://www.r-bloggers.com/sampling-distributions-and-central-limit-theorem-in-r/
#1-If you draw samples from a normal distribution, then the distribution of sample means is also normal.2-#1-The mean of the distribution of sample means is identical to the mean of the "parent population," the population from which the samples are drawn.3-The higher the sample size that is drawn, the "narrower" will be the spread of the distribution of sample means.
#http://msenux2.redwoods.edu/MathDept/R/CentralLimit.php

x=rnorm(500,mean=100,sd=10)
#every time u take new sample you will get similar plots
hist(x)
hist(x, prob=T)  #
hist(x, freq=F)  #same
lines(density(x), col='red', lwd=2)

#drawing samples from above distribution
#Each time we draw a sample of size n = 5 from the normal distribution having mean μ = 100 and standard deviation σ = 10, we need someplace to store the mean of the sample. Because we intend to collect the means of 500 samples, we initialize a vector xbar to initially contain 500 zeros
(xbar=rep(0,500))
mu=100; sigma=10 ; n=5

mean(rnorm(n,mean=mu,sd=sigma))  #put this in a loop
for (i in 1:500) { xbar[i]=mean(rnorm(n,mean=mu,sd=sigma)) }
xbar
hist(xbar,prob=TRUE,breaks=12,xlim=c(70,130),ylim=c(0,0.1))
mean(xbar)
#distribution of 500 sample means, each of which was found by selecting n = 5 numbers from the normal distribution with mean μ = 100 and standard deviation σ = 10, then computing their mean (average)
#increasing the sample size
(xbar2=rep(0,500)) ; n=10
for (i in 1:500) { xbar2[i]=mean(rnorm(n,mean=mu,sd=sigma)) }
hist(xbar2,prob=TRUE,breaks=12,xlim=c(70,130),ylim=c(0,0.1))
mean(xbar2)

#Key Idea: When we select samples from a normal distribution, then the distribution of sample means is also "normal" in shape.
#Key Idea: The mean of the distribution of sample means appears to be the same as the mean of the "parent population" from which we selected our samples.


#Confidence Interval -----
#In statistics, a confidence interval (CI) is a type of interval estimate, computed from the statistics of the observed data, that might contain the true value of an unknown population parameter.
#Point_Estimate +/- Confidence_Level * ((MarginOfError)/Sqrt(N))

#test before and after training
before = c(65, 78, 88, 55, 48, 95, 66, 57, 79, 81)
mean(before); length(before)# t-test becoz sample size < 30

after1=c(64, 52, 68, 75, 82, 66, 95, 83, 67, 76)

#1 sample t-test : assume mean= 82
#Ho: mean=82, Ha: mean!=82 : two tail test
t.test(x=before, y=NULL, mu=82, alternative = 'two.sided', conf.level = 0.95, paired=F)
hist(before)
qt(.975,df=9)  #if calc |tvalue| < table-t-value : Accept Ho 
?t.test
t.test(x=before, y=after1, mu=0, alternative = 'two.sided', conf.level = 0.95, paired=F)
#pvalue calc > 0.05: Accept Ho: No difference in means

#Conf Interval in LM
fit = lm(weight ~ height , data =women)
ndata = data.frame(height=c(55.5, 65.5))
predict(fit, newdata = ndata, interval = 'confidence')
confint(fit) # for coefficients 

#Hypothesis Testing----
#see my repository
#(https://github.com/dupadhyaya/rstatistics)

#ANOVA------
PlantGrowth
#weight of plants obtained under a control and two different treatment conditions
#http://www.sthda.com/english/wiki/one-way-anova-test-in-r
boxplot(weight ~ group, data=PlantGrowth)
res.aov <- aov(weight ~ group, data = PlantGrowth)
# Summary of the analysis
summary(res.aov)
#As the p-value is less than the significance level 0.05, we can conclude that there are significant differences between the groups highlighted with “*" in the model summary.
# to determine if the mean difference between specific pairs of group are statistically significant.
TukeyHSD(res.aov)
#It can be seen from the output, that only the difference between trt2 and trt1 is significant with an adjusted p-value of 0.012.

#Correlation/ Covariance-----
cov(women$height, women$weight)
cor(women$height, women$weight)
