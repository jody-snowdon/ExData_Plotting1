#
# plot2
# global active power linechart
#
# read the data in first
pwr <- read.table("./household_power_consumption.txt", header=T, sep=";", stringsAsFactors=FALSE)
pwr$Date <- as.Date(pwr$Date, format="%d/%m/%Y")
#
# only intrested in a couple of days
pwr <- pwr[(pwr$Date=="2007-02-01") | (pwr$Date=="2007-02-02"),]
#
# convert bits of interest to numeric
pwr$Sub_metering_1 <- as.numeric(pwr$Sub_metering_1)
pwr$Sub_metering_2 <- as.numeric(pwr$Sub_metering_2)
pwr$Sub_metering_3 <- as.numeric(pwr$Sub_metering_3)
#
# combine date and time together to make a timestamp
pwr$ts <- strptime(paste(pwr$Date, pwr$Time, sep=" "), format="%Y-%m-%d %H:%M:%S")
#
# create and save the plot
plot(pwr$ts, pwr$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
lines(pwr$ts, pwr$Sub_metering_2, col="red")
lines(pwr$ts, pwr$Sub_metering_3, col="blue")
legend("topright", col=c("black","red","blue"), c("Sub_metering_1  ","Sub_metering_2  ", "Sub_metering_3  "),lty=c(1,1), lwd=c(1,1))
dev.copy(png, file="plot3.png", width=480, height=480)
dev.off()
