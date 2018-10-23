# Packages Management in R

#List avl packages
library()

#Total Avl Packages in net
nrow(available.packages())

#Install Package - single & multiple
install.packages('amap')
install.packages(c('foreign', 'haven'))

#Load package
library(amap)

#Find functions in package (Tab)
library(help=amap)

#Help wrt a package(Pane)
help(package='amap')  #see on right side pane


#Unload/ Detach Packages---
search()
detach(package:amap, unload = T) 
search()


#Check if library avl for use
find.package("amap")
require(amap)  #this will check and load

#Remove Packages ----- uninstall 
install.packages('amap')
remove.packages("amap")
require('amap')# check if unistalled
find.package("amap")

#install easypackages
#Install Multiple Packages----
install.packages('easypackages')
easypackages::packages("plyr", "psych", "abc")
easypackages::libraries("plyr", "psych", "abc")


#Installing from other repositories
install.packages("CHAID", repos="http://R-Forge.R-project.org")
#github
require(devtools)
devtools::install_github("Espanta/lubripack")

#use lubripack package to install multiple package
library(lubripack)
lubripack("plyr", "psych", "tm", "quantmod")

#Check if package is avl for download from repository
pack = available.packages()
pack["ggplot2","Depends"]
#version which this ggplot2 requires
pack["amap","Depends"]






#This will unload/Detach all  packages
library(mise)
search()
mise(pkgs=T)
search()



# list all packages where an update is available
old.packages()

# update all available packages
update.packages()

# update, without prompts for permission/clarification
update.packages(ask = FALSE)
