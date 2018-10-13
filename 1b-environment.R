# R Environment

#list all variables in memory
ls()
x99 = 1:99
ls(pattern=c("x99"))
rm(pattern="x99")
ls(pattern=c("x99"))
rm(list=ls())  #all variables
#environment will be empty


#Session Information
sessionInfo()
#load library
library(dplyr)
#check for library 
sessionInfo()
#detach library
detach("package:dplyr", unload=TRUE)
#check if removed
sessionInfo()



#version of R
version

#Library Paths for Packages
.libPaths()

#files and folders
list.files()
list.dirs()  #many hidden folders
list.dirs("D:/rwork")
