setwd("D:/Roberto/R programing/exploratory data")

file<-"household_power_consumption.txt" 
power <- read.table(file, header=T, sep=";", dec=",")
power$Time <- strptime(paste(power$Date, power$Time), "%d/%m/%Y %H:%M:%S")
power$Date <- as.Date(power$Date, "%d/%m/%Y")

dates <- as.Date(c("2007-02-01", "2007-02-02"), "%Y-%m-%d")

power <- subset(power, Date %in% dates)


power$Global_active_power <- as.numeric(as.character(power$Global_active_power))

png("plot2.png", width=400, height=400)

plot(power$Time,power$Global_active_power,
         type="l",
	   xlab="",
         ylab="Global Active Power (kilowatts)",
         )


dev.off()

