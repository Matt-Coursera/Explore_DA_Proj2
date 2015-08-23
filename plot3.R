# Code to plot plot3.png

#Loading all possible needed libraries
library(utils)
library(plyr)
library(ggplot2)

# Reading in the data
SCC <- readRDS("Source_Classification_Code.rds")
NEI <- readRDS("summarySCC_PM25.rds")

#Building subsets for plot
balt <- subset (NEI, fips == "24510")
typePM <- ddply(balt, .(year, type), function(x) sum(x$Emissions))

## Rename the col: Emissions
colnames(typePM)[3] <- "Emissions"

#Building png.
png("plot3.png")
qplot(year, Emissions, data=typePM, color=type, geom ="line") +
        ggtitle(expression("Baltimore City" ~ PM[2.5] ~
        "Emmission by source, type and year")) + xlab("Year") +
        ylab(expression("Total" ~ PM[2.5] ~ "Emissions (in tons)"))
dev.off()

#Building plot
qplot(year, Emissions, data=typePM, color=type, geom ="line") +
        ggtitle(expression("Baltimore City" ~ PM[2.5] ~
        "Emmission by source, type and year")) + xlab("Year") +
        ylab(expression("Total" ~ PM[2.5] ~ "Emissions (in tons)"))
