thedata <- read.table("./household_power_consumption.txt", sep = ";", header = TRUE, na.strings = c("NA","?"))
subset <- thedata$Date %in% c("1/2/2007","2/2/2007")
smdata <- thedata[subset,]
x <- paste(smdata$Date, smdata$Time)
smdata$newestdate <- strptime(x, "%d/%m/%Y %H:%M:%S")
png(file="plot3.png", width = 480, height = 480, bg = "transparent")

with(smdata, plot(newestdate,Sub_metering_1,type="n",xlab="",ylab="Energy sub metering"))
with(smdata, lines(newestdate,Sub_metering_1))
with(smdata, lines(newestdate,Sub_metering_2,col="red1"))
with(smdata, lines(newestdate,Sub_metering_3,col="blue1"))
legend("topright", lty=c(1,1,1), col = c("black","red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"))

dev.off()