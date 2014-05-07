
thedata <- read.table("./household_power_consumption.txt", sep = ";", header = TRUE, na.strings = c("NA","?"))
thedata$newdate <- paste(thedata$Date, thedata$Time)
strptime(thedata$newdate, "%m/%d/%y %H:%M:%S")
subset <- thedata$Date %in% c("1/2/2007","2/2/2007")
smdata <- thedata[subset,]
png(file="plot1.png", width = 480, height = 480, bg = "transparent")
hist(smdata$Global_active_power,ylab="Frequency",xlab="Global Active Power (kilowatts)",col="red1", main="Global Active Power")
dev.off()