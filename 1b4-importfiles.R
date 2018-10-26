#Import / Export Data

#Check for files and folders
dir('./data2')
list.files('./data2')
list.files('./data')
file.exists("./data/mtcars.csv")

#Reading from a Flat File into a vector
list.files('./data2')
data = scan("./data2/hhe.txt", what="character")
head(data)
class(data)

#CSV  Read from CSV
#First Create as csv file from iris data set
head(iris)
?iris
write.csv(iris, "./data/iris.csv", row.names=F)
#goto folder data and see iris.csv

read1 = read.csv(file="./data/iris.csv", header = TRUE,sep = ",")
str(read1); class(read1) 
head(read1)

read2 = read.table(file="./data/iris.csv", header = TRUE,sep = ",")
str(read2);class(read2) 
head(read2)

read3 = read.delim(file="./data/iris.csv", header = TRUE,sep = ",")
str(read3) ; class(read3)
head(read3)

#or location is different from Project Folders, or want to search for the file
read4 = read.csv(file=file.choose())
str(read4)
head(read4)


#CSV file from web
read_web1 = read.csv('http://www.stats.ox.ac.uk/pub/datasets/csb/ch11b.dat')
head(read_web1)

#using library
library(data.table)
read_web2 = fread("http://www-bcf.usc.edu/~gareth/ISL/Advertising.csv")
head(read_web2)
class(read_web2)

#Text File from Web
read_txt = read.table("https://s3.amazonaws.com/assets.datacamp.com/blog_assets/test.txt",  header = FALSE)
head(read_txt)


#difference is use of specify delimeter(read.csv takes default as comma)

#----------------------
library(XML)
chess = 'http://ratings.fide.com/top.phtml?list=men'
#chess = 'http://ratings.fide.com/top.phtml?list=women'
chess.table = readHTMLTable(chess, header=T, which=5,stringsAsFactors=F)
head(chess.table)


#---------
library(haven)
# SAS
write_sas(mtcars, "./data2/mtcars.sas7bdat")
df_sas =read_sas("./data2/mtcars.sas7bdat")
head(df_sas)

# SPSS
write_sav(women, "./data2/women.sav")
df_spss = read_sav("./data2/women.sav")
head(df_spss)

#other Software
library(foreign)

# Read the SPSS data
df_spss2 <- read.spss("./data2/women.sav")
head(as.data.frame(df_spss2))
class(df_spss2)



#---------------------------------------
#Read from Table in Web
library('rvest'); library('xml2')
#One Table
url <- xml2::read_html("http://www.worldatlas.com/articles/largest-cities-in-europe-by-population.html")
(tbls = rvest::html_nodes(url, "table"))  #check if table is there
tbls_read <- url %>%  html_nodes("table") %>% html_table(fill = TRUE)
tbls_read

#Reading from Multiple Table in Websites
url2 = read_html("https://tradingeconomics.com/india/indicators")
(tbls = rvest::html_nodes(url2, "table"))  #check if table is there
tbls2_read <- url2 %>%  html_nodes("table") %>% html_table(fill = TRUE)
tbls2_read
tbls2_read[1]

#---------------------------------------
#Import from Google Sheet
library(gsheet)
url_gsheet = "https://docs.google.com/spreadsheets/d/1QogGSuEab5SZyZIw1Q8h-0yrBNs1Z_eEBJG7oRESW5k/edit#gid=107865534"
df_gsheet = as.data.frame(gsheet2tbl(url_gsheet))
head(df_gsheet)

#Import from Excel
# read in the first worksheet from the workbook myexcel.xlsx
# first row contains variable names

library(xlsx)
library(rJava)
Sys.setenv(JAVA_HOME='C:\\Program Files\\Java\\jre1.8.0_181')

df_excel1 = read.xlsx("./data2/myexcel.xlsx", 1)
head(df_excel1)
# read in the worksheet named mysheet
df_excel2a = read.xlsx("./data2/myexcel.xlsx", sheetName = "bowlers")
head(df_excel2a)
df_excel2b = read.xlsx("./data2/myexcel.xlsx", sheetIndex = 2)
head(df_excel2b)
