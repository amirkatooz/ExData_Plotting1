data <- read.table("./household_power_consumption.txt", header = TRUE, sep = ";", stringsAsFactors = FALSE)
subSet <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

datetime <- strptime(paste(subSet$Date, subSet$Time, sep=" "), "%d/%m/%Y %H:%M:%S")

SM1 <- as.numeric(subSet$Sub_metering_1)
SM2 <- as.numeric(subSet$Sub_metering_2)
SM3 <- as.numeric(subSet$Sub_metering_3)

png(filename = "plot3.png", width = 480, height = 480)
plot(datetime, SM1, type = "l", xlab = "", ylab = "Energy Submetering")
lines(datetime, SM2, type = "l", col = "red")
lines(datetime, SM3, type = "l", col = "blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty = 1, col = c("black", "red", "blue"))
dev.off()