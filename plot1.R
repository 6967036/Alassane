#======================Plot1=====================================================

base <- read.table("household_power_consumption.txt",header=TRUE, sep =";",
                   quote = "", dec =".",
                   col.names = c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3"),
                   nrows = 2880,skip = 66636,fill=TRUE)

hist(base$Global_active_power,main="Global Active Power",
     col="red",xlab="Global Active Power (kilowatts)")
dev.copy(png, file="plot1.png")
dev.off()
