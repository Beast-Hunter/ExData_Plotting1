# Set working directory
setwd("d:/Coursera/ExData_Plotting1")

# Read data
data = read.table("./household_power_consumption.txt", header=TRUE, sep=";", na.strings="?")

# Subsetting data
data =  data[data$Date %in% c("1/2/2007","2/2/2007"),]

data$DateTime = as.POSIXct(paste(data$Date, data$Time), format="%d/%m/%Y %H:%M:%S")

# Plotting data
png(filename = "plot3.png", width = 480, height = 480)

plot(data$DateTime, data$Sub_metering_1 , xlab = "", ylab = "Energy sub metering", type = "l")
lines(data$DateTime, data$Sub_metering_2, col = "red")
lines(data$DateTime, data$Sub_metering_3, col = "blue")
legend("topright", c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"), col = c("black","red","blue"), lty = 1)
dev.off()

