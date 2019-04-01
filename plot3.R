### Plot 3 ###
library(lubridate)

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
png("plot3.png",  width = 480, height = 480)
with(s.data, plot(DT, Sub_metering_1, type = "n", xlab = "", ylab = "Energy sub metering"))
lines(s.data$DT, s.data$Sub_metering_1, col = "black")
lines(s.data$DT, s.data$Sub_metering_2, col = "red")
lines(s.data$DT, s.data$Sub_metering_3, col = "blue")
legend("topright", lwd = 2, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()
