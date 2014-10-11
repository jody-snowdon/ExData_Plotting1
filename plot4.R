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
pwr$Voltage <- as.numeric(pwr$Voltage)
pwr$Global_active_power <- as.numeric(pwr$Global_active_power)
pwr$Global_reactive_power <- as.numeric(pwr$Global_reactive_power)
pwr$Sub_metering_1 <- as.numeric(pwr$Sub_metering_1)
pwr$Sub_metering_2 <- as.numeric(pwr$Sub_metering_2)
pwr$Sub_metering_3 <- as.numeric(pwr$Sub_metering_3)
#
# combine date and time together to make a timestamp
pwr$ts <- strptime(paste(pwr$Date, pwr$Time, sep=" "), format="%Y-%m-%d %H:%M:%S")
#
# create and save the plots
# ...four plots
par(mfrow=c(2,2))
#
# plot 1 - active power linechart
plot(pwr$ts,pwr$Global_active_power, type="l", xlab="", ylab="Global Active Power")
#
# plot 2 - voltage linechart
plot(pwr$ts,pwr$Voltage, type="l", xlab="datetime", ylab="Voltage")

#
# plot 3 - sub meter
plot(pwr$ts,pwr$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
lines(pwr$ts,pwr$Sub_metering_2,col="red")
lines(pwr$ts,pwr$Sub_metering_3,col="blue")
legend("topright", col=c("black","red","blue"), c("Sub_metering_1  ","Sub_metering_2  ", "Sub_metering_3  "),lty=c(1,1), bty="n", cex=.5) #bty removes the box, cex shrinks the text, spacing added after labels so it renders correctly

#
# plot 4 - global reactive power linechart
plot(pwr$ts,pwr$Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power")

#OUTPUT
dev.copy(png, file="plot4.png", width=480, height=480)
dev.off()
