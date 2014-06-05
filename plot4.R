plot4<-function()
{
    
    
    filename<-"table.csv"
    if(!file.exists(filename))
    {
        t<-read.csv("household_power_consumption.txt", sep=";", na.strings="?", header=TRUE, colClasses = c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric" ))
        t<-t[(t$Date=="1/2/2007") | (t$Date=="2/2/2007"), ]
        t$DateTime<-strptime(paste(t$Date, t$Time), "%d/%m/%Y %H:%M:%S")
        write.csv(t, filename)
    }
    else 
    {
        t<-read.csv(filename)
        t$DateTime<-strptime(paste(t$Date, t$Time), "%d/%m/%Y %H:%M:%S")
    }
    
    png(filename="plot4.png", width=480, height=480, units="px")
    par(mfrow=c(2,2))
    plot(t$DateTime, t$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")
    plot(t$DateTime, t$Voltage, type="l", xlab="datetime", ylab="Voltage")
    plot(t$DateTime, t$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering", col="black")
    lines(t$DateTime, t$Sub_metering_2, type="l",col="red")
    lines(t$DateTime, t$Sub_metering_3, type="l", col="blue")
    legend("topright", lty=1, lwd=1, col=c("black","blue", "red"), legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
    plot(t$DateTime, t$Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power")
    dev.off()
    
    
}
