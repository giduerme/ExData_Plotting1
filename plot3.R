## Plot 3: Cleaning the Data
power <- read.csv("household_power_consumption.txt", header=T, sep=';', na.strings="?", nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')
plot3 <- subset(power, Date %in% c("1/2/2007","2/2/2007"))
plot3$Date <- as.Date(plot3$Date, format="%d/%m/%Y")
datetime <- paste(as.Date(plot3$Date), plot3$Time)
plot3$Datetime <- as.POSIXct(datetime)

## Plot 3: Code for Plot and PNG Transformation
dev.copy(png, file="plot3.png", height=480, width=480)
with(plot3, {
  plot(Sub_metering_1~Datetime, type="l",
       ylab="Global Active Power (kilowatts)", xlab="")
  lines(Sub_metering_2~Datetime,col='Red')
  lines(Sub_metering_3~Datetime,col='Blue')
})
legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, 
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()
