## Project 1 - Generating 4 different plots

This assignment uses data from
the <a href="http://archive.ics.uci.edu/ml/">UC Irvine Machine
Learning Repository</a>, a popular repository for machine learning
datasets. In particular, we will be using the "Individual household
electric power consumption Data Set" which I have made available on
the course web site:

## Data file location
* "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"

* Description Measurements of electric power consumption in
one household with a one-minute sampling rate over a period of almost
4 years. Different electrical quantities and some sub-metering values
are available.

## Variables in the Data file
There are 9 variables in the dataset are taken
Date  ---> format dd/mm/yyyy
Time ---> time in format hh:mm:ss </li>
Global_active_power--->(household global minute-averaged active power (in kilowatt)
Global_reactive_power ---> household global minute-averaged reactive power (in kilowatt)
Voltage --->minute-averaged voltage (in volt)
Global_intensity --->household global minute-averaged current intensity (in ampere)
Sub_metering_1 ---> energy sub-metering No. 1 (in watt-hour of active energy). It corresponds to the kitchen, containing mainly a dishwasher, an oven and a microwave (hot plates are not electric but gas powered)
Sub_metering_2 --->energy sub-metering No. 2 (in watt-hour of active energy). It corresponds to the laundry room, containing a washing-machine, a tumble-drier, a refrigerator and a light
Sub_metering_3 --->energy sub-metering No. 3 (in watt-hour of active energy). It corresponds to an electric water-heater and an air-conditioner

## General data processing before plotting function is started
 1. Data is read from the local diretory from the data file household_power_consumption.txt
 2. Data is subset to pick the data corresponds to the 2 given dates- 2007-02-01 and 2007-02-02.
 3. New DateTime variable is created by combining the Date and Time Character columns and then transformed to Date class variable using the POSXlt function
 4. Then plot, hist functions are called with appropriate variables values set.

## plot1.R  --> generates  plot1.png
hist function is called with Global_Active_Power
## plot2.R  --> generates  plot2.png
plot funciton is called with DateTime and Global_Active_Power
## plot3.R  --> generates  plot3.png
plot function is called multiple times to overlay 3 graphs (DateTime on X and 3 Sub Metering variables on Y)
## plot4.R  --> generates  plot4.png
mfcol parameter is set to (2,2) and 4 plots are called sequentially to plot the graphs in the following order
1.plot (1,1) quadrant - topleft
2.plot(2,1) quadrant - bottom left
3.plot(1,2) quadrant - topright
4.plot(2,2) quadrant - bottom right


