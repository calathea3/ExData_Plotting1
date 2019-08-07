## load, select and transform the data
epstotal <- read.table("household_power_consumption.txt", header=TRUE, sep=";", dec=".", na.strings="?")
eps <- epstotal
eps$DateNew <- as.Date(eps$Date, "%d/%m/%Y")
eps <- subset(eps, DateNew >= "2007-02-01" & DateNew <= "2007-02-02")
eps$DateTimeNew <- strptime(paste(eps$DateNew, eps$Time), "%Y-%m-%d %H:%M:%S") 


## make plot 2
png("plot2.png", width=480, height=480)
plot(eps$DateTimeNew, eps$"Global_active_power",type = "l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()