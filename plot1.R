#Code to plot plot1.png

#Loading all possible needed libraries
library(utils)
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
SCC <- readRDS("Source_Classification_Code.rds")
NEI <- readRDS("summarySCC_PM25.rds")


#Prepping for plot.
length(NEI$Emissions)
length(NEI$year)
tot.PM25yr <- tapply(NEI$Emissions, NEI$year, sum)

#Building png.
png("plot1.png")

plot(names(tot.PM25yr), tot.PM25yr, type="l", xlab = "Year", ylab = expression
     ("Total" ~ PM[2.5] ~"Emissions (tons)"), main = expression("Total US" ~
        PM[2.5] ~ "Emissions by Year"), col="Purple")
dev.off()
#Building plot
plot(names(tot.PM25yr), tot.PM25yr, type="l", xlab = "Year",
     ylab = expression ("Total" ~ PM[2.5] ~"Emissions (tons)"), main = expression
     ("Total US" ~ PM[2.5] ~ "Emissions by Year"), col="Purple")
