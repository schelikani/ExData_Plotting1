##Scrip to generate the plot4.PNG file.

## Set the working directory and create the environment

## Read the data file household_power_consumption.txt from the working directory
## and assign this to a variable hpc

hpc = read.table("household_power_consumption.txt", header =T, sep=";", na.strings ="?", 
                 colClasses=c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric"))

## subset the data to so that resulting set has only data for 2 dates 2007-02-01 and 2007-02-02
hpc = subset(hpc, hpc$Date %in% c("1/2/2007","2/2/2007"))

## format the Date and Time columns and merge them into one DateTime column
hpc$DateTime = as.POSIXlt(paste(hpc$Date, hpc$Time), format="%d/%m/%Y %H:%M:%S")

## set the device to PNG and generate the required graph
xmax = max(hpc$Sub_metering_1,hpc$Sub_metering_2, hpc$Sub_metering_3)
png(filename="plot4.png", width =480, height =480, bg="white" )

## set the graph panel to house 4 sub panels using the mfcol parameter
par(mfcol=c(2,2))

## plot (1,1) quadrant - topleft
plot(hpc$DateTime, hpc$Global_active_power, xlab="", ylab="Global Active Power", type="l")

## plot(2,1) quadrant - bottom left
plot(hpc$DateTime,  hpc$Sub_metering_1, type ="l", col ="grey", ylim =c(0,xmax), xlab="", ylab="")
par(new=T)
lines(hpc$DateTime, hpc$Sub_metering_2, col="red", ylab="", xlab="")
lines(hpc$DateTime, hpc$Sub_metering_3, col="blue", ylab ="", ylab="")
title(ylab="Energy Sub Metering")
legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), 
       col=c("grey","red","blue"), lty=1, bty ="n")

## plot(1,2) quadrant - topright
plot(hpc$DateTime, hpc$Voltage, xlab="datetime", ylab="voltage", type="l")

## plot(2,2) quadrant - bottom right
plot(hpc$DateTime, hpc$Global_reactive_power, xlab="datetime", ylab="Global_reactive_power", type="l")

## set the device off and make the screen device
dev.off()
