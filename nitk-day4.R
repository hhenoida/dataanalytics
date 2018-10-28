marks1 = ceiling(rnorm(10, 6,2))
marks2 = ceiling(rnorm(10, 5,2))
df = data.frame(marks1, marks2)
head(df)
km = kmeans(df, centers=2)
km$cluster
df2=cbind(df, cluster=km$cluster)
df2[order(df2$cluster),]
plot(df$marks1, df$marks2, col=2:3, pch=c(16,17))
km$centers
points(km$centers, pch=20, cex=2, col=km$cluster)
 