# Set working directory
setwd("d:/Coursera/ExData_Plotting1")

# Read data
data = read.table("./household_power_consumption.txt", header=TRUE, sep=";", na.strings="?")

# Subsetting data
data =  data[data$Date %in% c("1/2/2007","2/2/2007"),]

data$DateTime = as.POSIXct(paste(data$Date, data$Time), format="%d/%m/%Y %H:%M:%S")

# Plotting data
png("plot4.png", width=480, height=480)

# Divide into 4 parts 
par(mfrow=c(2,2))

with(data, plot(DateTime, Global_active_power, type = "l"))
with(data, plot(DateTime, Voltage, type = "l"))
plot(data$DateTime, data$Sub_metering_1, xlab="", ylab = "Energy sub metering", type = "l")
lines(data$DateTime, data$Sub_metering_2, col = "red")
lines(data$DateTime, data$Sub_metering_3, col = "blue")
legend("topright", c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"), col = c("black","red","blue"), lty = 1)
with(data, plot(DateTime, Global_reactive_power, type = "l"))
dev.off()
