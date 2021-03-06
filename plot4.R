## Due to the speed of the machine I'm working with, I've decided to observe the data file in a text editor and gather the pertinent lines and column names by hand. I am certain there is a more elegant solution available, but this should do for now.
##You need to have downloaded and unzipped the data file into this folder for the code to work
data <- read.csv(file="household_power_consumption.txt", header=FALSE, col.names=c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3"), skip = 66637, nrows = 2880, sep = ";")

## Next we convert Time and Date to a Timestring variable of POSIXlt class
data$Timestring <- strptime(paste(data$Date, data$Time, sep = " "),  format="%d/%m/%Y %H:%M:%S")
## Aesthetic mods for plots, along with the 2x2 setup

## Opening the device
png(file="plot4.png")
## Aesthetic mods for plots
par(mfrow=c(2,2),cex=0.7)

## Plot 1
plot(data$Timestring, data$Global_active_power, type="l", ylab="Global Active Power (kilowatts)", xlab="")

## Plot 2
plot(data$Timestring, data$Voltage, type="l", ylab="Voltage", xlab="datetime")

## Plot 3
plot(data$Timestring, data$Sub_metering_1, ylab="Energy sub metering", xlab="", type="l")
lines(data$Timestring, data$Sub_metering_3, col="blue")
lines(data$Timestring, data$Sub_metering_2, col="red")
legend("topright",bty="n", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),col=c("black", "red", "blue"),lty=1)

## Plot 4
plot(data$Timestring, data$Global_reactive_power, type="l", ylab="Global_reactive_power", xlab="datetime")

## Close the device
dev.off()

