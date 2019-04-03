### Plot 4 ###
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

# Submetering_1 has the largest range of y values
# draw plot
png("plot4.png",  width = 480, height = 480)
par(mfrow= c(2, 2))
# first plot
with(s.data, plot(DT, Global_active_power, type = "l", xlab = "", ylab = "Global Active Power"))
# second plot
with(s.data, plot(DT, Voltage, type = "l", xlab = "datetime"))

# third plot
with(s.data, plot(DT, Sub_metering_1, type = "n", xlab = "", ylab = "Energy sub metering"))
lines(s.data$DT, s.data$Sub_metering_1, col = "black")
lines(s.data$DT, s.data$Sub_metering_2, col = "red")
lines(s.data$DT, s.data$Sub_metering_3, col = "blue")
legend("topright", lwd = 2, bty = "n", col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

# fourth plot
with(s.data, plot(DT, Global_reactive_power, type = "l", xlab = "datetime", ylab = "Global_reactive_power"), col = "black")

dev.off()
