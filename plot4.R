data <- read.table("./household_power_consumption.txt", header = TRUE, sep = ";", stringsAsFactors = FALSE)
subSet <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

datetime <- strptime(paste(subSet$Date, subSet$Time, sep=" "), "%d/%m/%Y %H:%M:%S")

GAP <- as.numeric(subSet$Global_active_power)
Vol <- as.numeric(subSet$Voltage)
SM1 <- as.numeric(subSet$Sub_metering_1)
SM2 <- as.numeric(subSet$Sub_metering_2)
SM3 <- as.numeric(subSet$Sub_metering_3)
GRP <- as.numeric(subSet$Global_reactive_power)

png(filename = "plot4.png", width = 480, height = 480)
par(mfrow = c(2, 2))

plot(datetime, GAP, type = "l", xlab = "", ylab = "Global Active Power")

plot(datetime, Vol, type = "l", xlab = "datetime", ylab = "Voltage")

plot(datetime, SM1, type = "l", xlab = "", ylab = "Energy Submetering")
lines(datetime, SM2, type = "l", col = "red")
lines(datetime, SM3, type = "l", col = "blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty = 1, col = c("black", "red", "blue"), bty = "n")

plot(datetime, GRP, type = "l", xlab = "datetime", ylab = "Global_reactive_power")

dev.off()