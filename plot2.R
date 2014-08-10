#======================Plot2=====================================================
base <- read.table("household_power_consumption.txt",header=TRUE, sep =";",
                   quote = "", dec =".",
                   col.names = c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3"),
                   nrows = 2880,skip = 66636,fill=TRUE)

x <- base[,"Global_active_power"]
serie <- ts(x ,frequency=1440)
plot(serie, main = " ",type = "s", xaxt = "n",xlab=" ", ylab="Global Active Power (kilowatts)" ,frame = TRUE)
axis(1, 1:3, c("Thu","Fri","Sat"))

dev.copy(png, file="plot2.png")
dev.off()
