##Plot 2: Cleaning the Data
power <- read.csv("household_power_consumption.txt", header=T, sep=';', na.strings="?", nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')
plot2 <- subset(power, Date %in% c("1/2/2007","2/2/2007"))
plot2$Date <- as.Date(plot2$Date, format="%d/%m/%Y")
datetime <- paste(as.Date(plot2$Date), plot2$Time)
plot2$Datetime <- as.POSIXct(datetime)

## Plot 2: Code for Plot and PNG Transformation
dev.copy(png, file="plot2.png", height=480, width=480)
with(plot2, {
  plot(Global_active_power~Datetime, type="l",
       ylab="Global Active Power (kilowatts)", xlab="")
})
dev.off()
