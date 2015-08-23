# Code to plot plot6.png

#Loading all possible needed libraries
library(utils)
library(plyr)
library(ggplot2)

# Reading in the data
SCC <- readRDS("Source_Classification_Code.rds")

#Getting levels for vehicles defined
v.uniq <- unique(grep("Vehicles", SCC$EI.Sector, ignore.case = TRUE, value = TRUE))
vehic <- SCC[SCC$EI.Sector %in% v.uniq, ]["SCC"]

#Building subsets for Balt
emV.ba <- NEI[NEI$SCC %in% vehic$SCC & NEI$fips == "24510", ]
#Building subsets for LA
emV.LA <- NEI[NEI$SCC %in% vehic$SCC & NEI$fips == "06037", ]

#Putting data togther
emV.both <- rbind(emV.ba, emV.LA)

#Getting emessions for Balt and LA
emV.county <- aggregate (Emissions ~ fips * year, data =emV.both, FUN = sum )
emV.county$county <- ifelse(emV.county$fips == "06037", "Los Angeles", "Baltimore")

#Building png.
png("plot6.png", width=750)
qplot(year, Emissions, data=emV.county, geom="line", color=county) + ggtitle(expression("
        Motor Vehicle Emission Levels" ~ PM[2.5] ~ "  from 1999 to 2008 in Los Angeles County, CA
        and Baltimore, MD")) + xlab("Year") + ylab(expression("Levels of" ~ PM[2.5] ~ " Emissions"))
dev.off()

#Building plot
qplot(year, Emissions, data=emV.county, geom="line", color=county) + ggtitle(expression("
        Motor Vehicle Emission Levels" ~ PM[2.5] ~ "  from 1999 to 2008 in Los Angeles County, CA
        and Baltimore, MD")) + xlab("Year") + ylab(expression("Levels of" ~ PM[2.5] ~ " Emissions"))