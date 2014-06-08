tmp <- read.csv("household_power_consumption.txt", sep=';', header=TRUE, na.strings='?', colClasses=c('character', 'character', 'numeric','numeric','numeric','numeric','numeric','numeric','numeric'))
tmp$Date <- as.Date(tmp$Date, format="%d/%m/%Y")
data <- subset(tmp, (tmp$Date >'2007-01-31' & tmp$Date < '2007-02-03'))

# Merge date & time as new column
data$datetime <- as.POSIXct(paste(data$Date, data$Time))

# Set up png plot device
png("plot1.png")

# 1 Global Active Power histogram     
hist(data$Global_active_power, xlab="Global Active Power (kilowatts)", main = "Global Active Power", col="red")

# Close device
dev.off()