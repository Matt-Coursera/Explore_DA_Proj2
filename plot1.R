#Code to plot plt1.png
library(plyr)
library(ggplot2)


#Setup for download
archiveURL <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2FNEI_data.zip"
archiveFile <- "NEI_data.zip"

#Download the file
download.file(url=archiveURL,destfile=archiveFile)

#Uncompress files
unzip ("NEI_data.zip")

# Reading in the data
SRC <- readRDS("Source_Classification_Code.rds")
NEI <- readRDS("summarySCC_PM25.rds")
