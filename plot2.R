tmp <- read.csv("household_power_consumption.txt", sep=';', header=TRUE, na.strings='?', colClasses=c('character', 'character', 'numeric','numeric','numeric','numeric','numeric','numeric','numeric'))
tmp$Date <- as.Date(tmp$Date, format="%d/%m/%Y")
data <- subset(tmp, (tmp$Date >'2007-01-31' & tmp$Date < '2007-02-03'))

# Merge date & time as new column
data$datetime <- as.POSIXct(paste(data$Date, data$Time))

# Set up png plot device
png("plot2.png")
 
plot(data$datetime, data$Global_active_power, type="l", ylab="Global Active Power (kilowatts)", xlab="")

# Close device
dev.off()