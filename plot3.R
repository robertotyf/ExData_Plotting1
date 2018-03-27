setwd("D:/Roberto/R programing/exploratory data")

file<-"household_power_consumption.txt" 
power <- read.table(file, header=T, sep=";", dec=",")
power$Time <- strptime(paste(power$Date, power$Time), "%d/%m/%Y %H:%M:%S")
power$Date <- as.Date(power$Date, "%d/%m/%Y")

dates <- as.Date(c("2007-02-01", "2007-02-02"), "%Y-%m-%d")

power <- subset(power, Date %in% dates)


power$Global_active_power <- as.numeric(as.character(power$Global_active_power))
power$Sub_metering_1 <- as.numeric(as.character(power$Sub_metering_1))
power$Sub_metering_2 <- as.numeric(as.character(power$Sub_metering_2))
power$Sub_metering_3 <- as.numeric(as.character(power$Sub_metering_3))



png("plot3.png", width=400, height=400)

plot(power$Time, power$Sub_metering_1, type="l", col="black",
         xlab="", ylab="Energy sub metering")

lines(power$Time, power$Sub_metering_2, col="red")
lines(power$Time, power$Sub_metering_3, col="blue")
    legend("topright",
           col=c("black", "red", "blue"),
           c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
           lty=1)

dev.off()
