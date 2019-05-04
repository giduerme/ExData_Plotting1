##Plot 1: Cleaning the Data
power <- read.csv("household_power_consumption.txt", header=T, sep=';', na.strings="?", nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')
plot1 <- subset(power, Date %in% c("1/2/2007","2/2/2007"))
plot1$Date <- as.Date(plot1$Date, format="%d/%m/%Y")

## Plot 1: Code for Plot and PNG Transformation
png("plot1.png", width=480, height=480)
hist(plot1$Global_active_power, main="Global Active Power", 
     xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")
dev.off()
