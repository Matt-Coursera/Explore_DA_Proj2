#Code to plot plot2.png
#Assuming files were already downloaded and unzipped for plot1.

# Reading in the data
SCC <- readRDS("Source_Classification_Code.rds")
NEI <- readRDS("summarySCC_PM25.rds")

#Building subsets for plot
balt <- subset (NEI, fips == "24510")
totalPM <- tapply(balt$Emissions, balt$year, sum)

#Building png.
png("plot2.png")
plot(names(totalPM), totalPM, type = "l", xlab="Year", ylab= expression("Total" ~ PM[2.5] ~ "Emissions (tons)"),
     main=expression("Total for Baltimore City" ~ PM[2.5] ~ "Emissions by Year"), col = "Navy")
dev.off()

#Building plot
plot(names(totalPM), totalPM, type = "l", xlab="Year", ylab=expression("Total" ~ PM[2.5] ~ "Emissions (tons)"),
     main=expression("Total for Baltimore City" ~ PM[2.5] ~ "Emissions by Year"), col="Navy")