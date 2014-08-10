#================================Plot4==============================
base <- read.table("household_power_consumption.txt",header=TRUE, sep =";",
                   quote = "", dec =".",
                   col.names = c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3"),
                   nrows = 2880,skip = 66636,fill=TRUE)

par(mfrow=c(2,2),mar=c(4,4,2,1))

x <- base[,"Global_active_power"]
serie <- ts(x ,frequency=1440)
plot(serie, main = " ",type = "s", xaxt = "n",xlab=" ", ylab="Global Active Power (kilowatts)" ,frame = TRUE)
axis(1, 1:3, c("Thu","Fri","Sat"))
#-------------------------------------------------
x <- base[,"Voltage"]
serie2 <- ts(x ,frequency=1440)
plot(serie2, main = " ",type = "s", xaxt = "n",xlab=" ", ylab="Voltage" ,frame = TRUE)
axis(1, 1:3, c("Thu","Fri","Sat"))
#-----------------------------------------------------------------------------------------
x <- base[,"Sub_metering_1"]
y <- base[,"Sub_metering_2"]
z <- base[,"Sub_metering_3"]
matrice <- c(x,y,z)
mat <- matrix(matrice,nrow=2880)
dim(mat)
serie1 <- ts(x ,frequency=1440)
serie2 <- ts(y ,frequency=1440)
serie3 <- ts(z ,frequency=1440)

matplot(seq(2880), mat, type = "s", lty = c("solid", "solid","solid"),
        lwd =1, col = c("black","red", "blue"), xlab=" ", xaxt = "n",ylab="Energy sub metering")
axis(1, 1:3, c("Thu","Fri","Sat"))

legend("topright", c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), col=c("black","red","blue"),
       text.col = "black", lty = c(1, 1, 1), pch = c(-1, -1, -1),
       merge = TRUE,bty = "n")

#-----------------------------------------------------------------------------------------

x <- base[,"Global_reactive_power"]
serie <- ts(x ,frequency=1440)
plot(serie, main = " ",type = "s", xaxt = "n",xlab=" ", ylab="Global_reactive_power" ,frame = TRUE)
axis(1, 1:3, c("Thu","Fri","Sat"))

dev.copy(png, file="plot4.png")
dev.off()
