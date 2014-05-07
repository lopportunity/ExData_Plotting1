thedata <- read.table("./household_power_consumption.txt", sep = ";", header = TRUE, na.strings = c("NA","?"))
subset <- thedata$Date %in% c("1/2/2007","2/2/2007")
smdata <- thedata[subset,]
x <- paste(smdata$Date, smdata$Time)
smdata$newestdate <- strptime(x, "%d/%m/%Y %H:%M:%S")
png(file="plot4.png", width = 480, height = 480, bg = "transparent")

par(mfrow=c(2,2))
with(smdata, {
  
  plot(smdata$newestdate, smdata$Global_active_power, type="l", ylab = "Global Active Power (kilowatts)", xlab = "")
  plot(newestdate,Voltage,type='l',xlab="datetime",ylab="Voltage")
  plot(newestdate,Sub_metering_1,type="n",xlab="",ylab="Energy sub metering")
  lines(newestdate,Sub_metering_1)
  lines(newestdate,Sub_metering_2,col="red1")
  lines(newestdate,Sub_metering_3,col="blue1")
  legend("topright", lty=c(1,1,1), col = c("black","red", "blue"), bty="n", legend = c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"))
  plot(newestdate,Global_reactive_power,type='l',xlab="datetime")
  
})

dev.off()