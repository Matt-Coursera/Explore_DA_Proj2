# Code to plot plot4.png

#Loading all possible needed libraries
library(plyr)
library(ggplot2)

# Reading in the data
SCC <- readRDS("Source_Classification_Code.rds")

#Building subset for only coal-combustion
coalcomb.scc <- subset(SCC, EI.Sector %in% c("Fuel Comb - Comm/Instutional - Coal",
        "Fuel Comb - Electric Generation - Coal", "Fuel Comb - Industrial Boilers, ICEs - Coal"))


#Building subset for combination
coal.comb <- subset(NEI, SCC %in% coalcomb.codes)

#Getting pm25
coalcomb.pm <- ddply(coal.comb, .(year, type), function(x) sum(x$Emissions))

#Rename the col
colnames(coalcomb.pm)[3] <- "Emissions"

#Building png.
png("plot4.png")
qplot(year, Emissions, data=coalcomb.pm, color=type, geom="line") + stat_summary(fun.y = "sum",
        fun.ymin = "sum", fun.ymax = "sum", color = "purple", aes(shape="total"), geom="line") +
        geom_line(aes(size="total", shape = NA)) + ggtitle(expression("Coal Combustion" ~ PM[2.5] ~
        "Emissions by Source Type and Year")) + xlab("Year") +
        ylab(expression("Total" ~ PM[2.5] ~ "Emissions (tons)"))
dev.off()


#Building plot
qplot(year, Emissions, data=coalcomb.pm, color=type, geom="line") + stat_summary(fun.y = "sum",
        fun.ymin = "sum", fun.ymax = "sum", color = "purple", aes(shape="total"), geom="line") +
        geom_line(aes(size="total", shape = NA)) + ggtitle(expression("Coal Combustion" ~ PM[2.5] ~
        "Emissions by Source Type and Year")) + xlab("Year") +
        ylab(expression("Total" ~ PM[2.5] ~ "Emissions (tons)"))