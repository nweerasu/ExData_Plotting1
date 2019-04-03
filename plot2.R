### Plot 2 ###
library(lubridate)

# download data
url <- "http://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"

download.file(url, destfile = "./data/exdata_house.zip", method = "curl")

# unzip
unzip("./data/exdata_house.zip", exdir = "./data")

# read in data
data <- read.table("data/household_power_consumption.txt", sep = ";", header = TRUE, na.strings = "?")

# change Date factor to date format
data$Date <- dmy(data$Date)

#subset based on range required, Feb 1, 2007 to Feb 2, 2007
s.data <- subset(data, data$Date >= "2007-02-01" & data$Date <= "2007-02-02")

# paste day and time into one column
s.data$DT <- paste(s.data$Date, s.data$Time)
s.data$DT <- ymd_hms(s.data$DT)

# draw plot
png("plot2.png",  width = 480, height = 480)
with(s.data, plot(DT, Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)"))
dev.off()

