## load, select and transform the data
epstotal <- read.table("household_power_consumption.txt", header=TRUE, sep=";", dec=".", na.strings="?")
eps <- epstotal
eps$DateNew <- as.Date(eps$Date, "%d/%m/%Y")
eps <- subset(eps, DateNew >= "2007-02-01" & DateNew <= "2007-02-02")
eps$DateTimeNew <- strptime(paste(eps$DateNew, eps$Time), "%Y-%m-%d %H:%M:%S") 


## make plot 3
png("plot3.png", width=480, height=480)

plot(eps$DateTimeNew, eps$"Sub_metering_1", col="black",type = "l",  xlab="",ylab="Energy sub metering")
lines(eps$DateTimeNew, eps$"Sub_metering_2", type = "l", col = "red")
lines(eps$DateTimeNew, eps$"Sub_metering_3", type = "l", col = "blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))

dev.off()