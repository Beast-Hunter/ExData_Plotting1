# Set working directory
setwd("d:/Coursera/ExData_Plotting1")

# Read data
data = read.table("./household_power_consumption.txt", header=TRUE, sep=";", na.strings="?")

# Subsetting data
data =  data[data$Date %in% c("1/2/2007","2/2/2007"),]

data$DateTime = as.POSIXct(paste(data$Date, data$Time), format="%d/%m/%Y %H:%M:%S")

# Plotting data
png("plot2.png", width=480, height=480)

plot(as.POSIXct(data$DateTime), data$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")
dev.off()