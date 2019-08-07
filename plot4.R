## load, select and transform the data
epstotal <- read.table("household_power_consumption.txt", header=TRUE, sep=";", dec=".", na.strings="?")
eps <- epstotal
eps$DateNew <- as.Date(eps$Date, "%d/%m/%Y")
eps <- subset(eps, DateNew >= "2007-02-01" & DateNew <= "2007-02-02")
eps$DateTimeNew <- strptime(paste(eps$DateNew, eps$Time), "%Y-%m-%d %H:%M:%S") 


## make plot 4 
png("plot4.png", width=480, height=480)

par(mfcol=(c(2,2)))

plot(eps$DateTimeNew, eps$"Global_active_power",type = "l", xlab="", ylab="Global Active Power (kilowatts)")
 
plot(eps$DateTimeNew, eps$"Sub_metering_1", col="black",type = "l",  xlab="",ylab="Energy sub metering")
lines(eps$DateTimeNew, eps$"Sub_metering_2", type = "l", col = "red")
lines(eps$DateTimeNew, eps$"Sub_metering_3", type = "l", col = "blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))
 
plot(eps$DateTimeNew, eps$"Voltage", col="black",type = "l", xlab="datetime",ylab="Voltage")

plot(eps$DateTimeNew, eps$"Global_reactive_power",type = "l", xlab="datetime", ylab="Global_reactive_power")
 
dev.off()