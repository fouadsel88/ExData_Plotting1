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


#save plot in plot2.png 
png(filename = "plot2.png", width = 480 ,height = 480  )


#plot Globale active power and time.
plot(Dsub$Time,Dsub$Global_active_power, type = "l" , xlab = "", ylab = "Global active power (Kilowatts)")
  
dev.off()
