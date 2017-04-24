#Load data into R
D <- read.table ("household_power_consumption.txt", sep =";" ,header = T , na.strings  = "?",
                 colClasses = c ("character", "character","numeric","numeric","numeric",
                                 "numeric","numeric","numeric","numeric"))
#convert Time
D$Time <- strptime(paste(D$Date, D$Time),  "%d/%m/%Y %H:%M:%S" )

# convert date 
D$Date <- as.Date(D$Date, "%d/%m/%Y")

# subset the data from "2007-02-01" to "2007-02-02"
Y <- as.Date(c("2007-02-01", "2007-02-02"), "%Y-%m-%d")
Dsub<- subset(D , Date %in% Y)


#save plot in plot4.png 
png(filename = "plot4.png", width = 480 ,height = 480  )


# 4 figure will be drawn 4 row and 2 columns
par(mfrow= c(2,2))

# the first plot
plot(Dsub$Time,Dsub$Global_active_power, type = "l" , xlab = "",
          ylab= " Global Activity Power")

# the second plot
plot(Dsub$Time,Dsub$Voltage, type = "l" , xlab = "datetime",ylab = "Voltage" )
# the third plot

x<-range(Dsub$Sub_metering_1,Dsub$Sub_metering_2,Dsub$Sub_metering_3)
plot(Dsub$Time,Dsub$Sub_metering_1, type = "l", col = "black" ,ylim = x ,
     ylab = "Energy Sub Metering", xlab = "")
par(new= T)
plot(Dsub$Time,Dsub$Sub_metering_2, type = "l", col = "red", ylim = x,
     axes = F ,ylab = "", xlab = "")
par(new=T)
plot(Dsub$Time,Dsub$Sub_metering_3, type = "l", col =  "blue", ylim = x,
     axes = F ,ylab = "", xlab= "")
legend("topright",lty = c(1,1,1), col = c("black", "red","blue"), 
       legend = c("sub_metering_1","sub_metering_2","sub_metering_3"),cex = 0.2
       ,bty="n" )
# the fourth plot

plot(Dsub$Time,Dsub$Global_reactive_power, type = "l" , xlab = "datetime",
          ylab= " Global_Reactivity_Power")

  
dev.off()
