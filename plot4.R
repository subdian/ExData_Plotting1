tmp <- read.csv("household_power_consumption.txt", sep=';', header=TRUE, na.strings='?', colClasses=c('character', 'character', 'numeric','numeric','numeric','numeric','numeric','numeric','numeric'))
tmp$Date <- as.Date(tmp$Date, format="%d/%m/%Y")
data <- subset(tmp, (tmp$Date >'2007-01-31' & tmp$Date < '2007-02-03'))

# Merge date & time as new column
data$datetime <- as.POSIXct(paste(data$Date, data$Time))

# Set up png plot device
png("plot4.png")
   
#4 2x2 layout of four plots
par(mfrow = c(2,2), cex=0.8)
#4.1
plot(data$datetime, data$Global_active_power, type="l", ylab="Global Active Power", xlab="")

#4.2
plot(data$datetime, data$Voltage, type="l", ylab="Voltage", xlab="datetime")

#4.3
plot(data$datetime, data$Sub_metering_1, ylab="Energy sub metering", type="l", xlab="")
lines(data$datetime, data$Sub_metering_2, col="red")
lines(data$datetime, data$Sub_metering_3, col="blue")
legend("topright", inset=0.01,  lty=c(1,1), lwd=c(2,2,2), col= c("black", "red", "blue"),legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), box.lwd=0)

#4.4
plot(data$datetime, data$Global_reactive_power, type="l", ylab="Global_reactive_power", xlab="datetime")

# Close device
dev.off()