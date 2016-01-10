## Due to the speed of the machine I'm working with, I've decided to observe the data file in a text editor and gather the pertinent lines and column names by hand. I am certain there is a more elegant solution available, but this should do for now.
##You need to have downloaded and unzipped the data file into this folder for the code to work
data <- read.csv(file="household_power_consumption.txt", header=FALSE, col.names=c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3"), skip = 66637, nrows = 2880, sep = ";")

## Next we convert Time and Date to a Timestring variable of POSIXlt class
data$Timestring <- strptime(paste(data$Date, data$Time, sep = " "),  format="%d/%m/%Y %H:%M:%S")
## Opening the device
png(file="plot1.png")
## Aesthetic mods for plots
par(cex=0.7, oma=c(3,3,3,3))
## Code for the plot
hist(data$Global_active_power, main="Global Active Power", col="red", xlab="Global Active Power (kilowatts)")
## Close the device
dev.off()

