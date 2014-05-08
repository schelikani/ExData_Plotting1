##Scrip to generate the plot3.PNG file.

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
png(filename="plot3.png", width =480, height =480, bg="white" )

## plot the first graph for Sub_metering_1 in GREY
plot(hpc$DateTime,  hpc$Sub_metering_1, type ="l", col ="grey", ylim =c(0,xmax), xlab="", ylab="")

## make sure next plot is added to the current plot
## draw the line for Sub_metering_2 in RED
par(new=T)
lines(hpc$DateTime, hpc$Sub_metering_2, col="red", ylab="", xlab="")

## draw the line for Sub_metering_3 in BLUE
lines(hpc$DateTime, hpc$Sub_metering_3, col="blue", ylab ="", ylab="")

## add the X, y axis lables and Legend
title(ylab="Energy Sub Metering")
legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), 
       col=c("grey","red","blue"), lty=1)

## set the device off and make the screen device
dev.off()
