#CHAID - dataset USvote #multisplit
# require(rsample) # for dataset and splitting also loads broom and tidyr
install.packages("CHAID", repos="http://R-Forge.R-project.org")
library(CHAID)  #library for performing CHAID decision tree
#used when all variables are categories
#Dataset
data(USvote)  #from lib CHAID
?USvote
head(USvote)
str(USvote)
#Quick CHAID analysis
set.seed(101)
nrow(USvote)
sample1 = USvote[sample(1:nrow(USvote), 1000),]
chaidModel = chaid(vote3 ~ ., data = sample1, control=chaid_control(minbucket = 20, minsplit=7, minprob=0))
#minsplit	Number of observations in splitted response at which no further split is desired.
#minbucket Minimum number of observations in terminal nodes.
#minprob	Mininimum frequency of observations in terminal nodes.
print(chaidModel)
plot(chaidModel)
?chaid
