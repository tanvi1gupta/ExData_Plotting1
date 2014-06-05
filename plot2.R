plot2<-function()
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
    
    png(filename="plot2.png", width=480, height=480, units="px")
    plot(t$DateTime, t$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")
    dev.off()
   
    
}
