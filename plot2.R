
thedata <- read.table("./household_power_consumption.txt", sep = ";", header = TRUE, na.strings = c("NA","?"))

subset <- thedata$Date %in% c("1/2/2007","2/2/2007")
smdata <- thedata[subset,]

x <- paste(smdata$Date, smdata$Time)
smdata$newestdate <- strptime(x, "%d/%m/%Y %H:%M:%S")

png(file="plot2.png", width = 480, height = 480, bg = "transparent")
plot(smdata$newestdate, smdata$Global_active_power, type="l", ylab = "Global Active Power (kilowatts)", xlab = "")
dev.off()