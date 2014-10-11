#
# plot1
# global active power histogram
#
# read the data in first
pwr <- read.table("./household_power_consumption.txt", header=T, sep=";", stringsAsFactors=FALSE)
pwr$Date <- as.Date(pwr$Date, format="%d/%m/%Y")
#
# only intrested in a couple of days
pwr <- pwr[(pwr$Date=="2007-02-01") | (pwr$Date=="2007-02-02"),]
pwr$Global_active_power <- as.numeric(pwr$Global_active_power)
#
# create and save the plot
hist(pwr$Global_active_power, main = paste("Global Active Power"), col="red", xlab="Global Active Power (kilowatts)")
dev.copy(png, file="plot1.png", width=480, height=480)
dev.off()