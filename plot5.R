# Code to plot plot5.png

#Loading all possible needed libraries
library(utils)
library(plyr)
library(ggplot2)

# Reading in the data
SCC <- readRDS("Source_Classification_Code.rds")
NEI <- readRDS("summarySCC_PM25.rds")

#Building subsets for plot assumpting motor vehicles = On and
## check the levels for types of vehicles defined
v.uniq <- unique(grep("Vehicles", SCC$EI.Sector, ignore.case = TRUE, value = TRUE))
vehic <- SCC[SCC$EI.Sector %in% v.uniq, ]["SCC"]

#Building subsets for the vehicles emissions from Baltimore, MD.
emV.ba <- NEI[NEI$SCC %in% vehic$SCC & NEI$fips == "24510",]

#Building subset of emissions for vehicles in Baltimore for every year
baltv.pm <- ddply(emV.ba, .(year), function(x) sum(x$Emissions))
colnames(baltv.pm)[2] <- "Emissions"

#Building png.
png("plot5.png")
qplot(year, Emissions, data=baltv.pm, geom="line") + ggtitle(expression("Baltimore City"
        ~ PM[2.5] ~ "Motor Vehicle Emissions by Year")) + xlab("Year") + ylab(expression("Total"
         ~ PM[2.5] ~ "Emissions (tons)"))
dev.off()

#Building plot
qplot(year, Emissions, data=baltv.pm, geom="line") + ggtitle(expression("Baltimore City"
        ~ PM[2.5] ~ "Motor Vehicle Emissions by Year")) + xlab("Year") + ylab(expression("Total"
        ~ PM[2.5] ~ "Emissions (tons)"))
