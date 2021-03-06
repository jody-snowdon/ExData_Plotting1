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
pwr$Global_active_power <- as.numeric(as.character(pwr$Global_active_power))
#
# combine date and time together to make a timestamp
pwr$ts <- strptime(paste(pwr$Date, pwr$Time, sep=" "), format="%Y-%m-%d %H:%M:%S")
#
# create and save the plot
plot(pwr$ts, pwr$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.copy(png, file="plot2.png", width=480, height=480)
dev.off()