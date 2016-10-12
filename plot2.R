data <- read.table("./household_power_consumption.txt", header = TRUE, sep = ";", stringsAsFactors = FALSE)
subSet <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

datetime <- strptime(paste(subSet$Date, subSet$Time, sep=" "), "%d/%m/%Y %H:%M:%S")

GAP <- as.numeric(subSet$Global_active_power)

png(filename = "plot2.png", width = 480, height = 480)
plot(datetime, GAP, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")
dev.off()