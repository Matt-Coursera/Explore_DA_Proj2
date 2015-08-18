ag <- read.table ("getdata-data-ss06hid (1).csv")

https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv

https://d396qusza40orc.cloudfront.net/getdata%2Fjeff.jpg


url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv"
getdata-data-GDP.csv
"getdata-data-GDP (2).csv"


if(!file.exists("./data")){dir.create("./data")}
fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv?accessType=DOWNLOAD"
download.file(fileUrl,destfile="./data/gdp.csv")

dtgdp <- data.table(read.csv("./data/gdp.csv", skip=5)


if(!file.exists("./data")){dir.create("./data")}
fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv?accessType=DOWNLOAD"
download.file(fileUrl,destfile="./data/gdp.csv")



readRDS(file, refhook = NULL)   #Sets up to read file
test <- readRDS(file, refhook = NULL)  #Reads file into variable "test"
View(test)  # View "test"