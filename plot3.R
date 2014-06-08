tmp <- read.csv("household_power_consumption.txt", sep=';', header=TRUE, na.strings='?', colClasses=c('character', 'character', 'numeric','numeric','numeric','numeric','numeric','numeric','numeric'))
tmp$Date <- as.Date(tmp$Date, format="%d/%m/%Y")
data <- subset(tmp, (tmp$Date >'2007-01-31' & tmp$Date < '2007-02-03'))

# Merge date & time as new column
data$datetime <- as.POSIXct(paste(data$Date, data$Time))

# Set up png plot device
png("plot3.png")
   
plot(data$datetime, data$Sub_metering_1, ylab="Energy sub metering", type="l", xlab="")
lines(data$datetime, data$Sub_metering_2, col="red")
lines(data$datetime, data$Sub_metering_3, col="blue")
legend("topright", lty=c(1,1), lwd=c(2,2,2), col= c("black", "red", "blue"),legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), cex=0.8)

# Close device
dev.off()