##Scrip to generate the Plot1.PNG file.

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
png(filename="plot1.png", width =480, height =480, bg="white" )
hist(hpc$Global_active_power, col ="red", xlab ="Global Active Power(kilowatts)", main ="Global Active Power")
## set the device off and make the screen device
dev.off()

