### Plot 1 ###

# read in data
data <- read.table("data/household_power_consumption.txt", sep = ";", header = TRUE, na.strings = "?")

# change Date factor to date format
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")

#subset based on range required, Feb 1, 2007 to Feb 2, 2007
s.data <- subset(data, data$Date >= "2007-02-01" & data$Date <= "2007-02-02")

png("plot1.png")
with(s.data, hist(Global_active_power, xlab = "Global Active Power (kilowatts)", col = "red",  main = "Global Active Power"))
dev.off()
