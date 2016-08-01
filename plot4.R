## Working directory & file location
setwd("~/datasciencecoursera/ExploratoryDataAnalysis/ProjectWk1/")

## Read the data file into memory
Data <- read.table("./household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")

## Subset the relevant data for the plot 
SubsetData <- Data[Data$Date %in% c("1/2/2007","2/2/2007") ,]
DateTime <- strptime(paste(SubsetData$Date, SubsetData$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
GlobalActivePower <- as.numeric(SubsetData$Global_active_power)
GlobalReactivePower <- as.numeric(SubsetData$Global_reactive_power)
Voltage <- as.numeric(SubsetData$Voltage)
SubMetering1 <- as.numeric(SubsetData$Sub_metering_1)
SubMetering2 <- as.numeric(SubsetData$Sub_metering_2)
SubMetering3 <- as.numeric(SubsetData$Sub_metering_3)

## Create & format the plot
par(mfrow = c(2, 2)) 
plot(DateTime, GlobalActivePower, type="l", xlab="", ylab="Global Active Power", cex=0.2)
plot(DateTime, Voltage, type="l", xlab="datetime", ylab="Voltage")
plot(DateTime, SubMetering1, type="l", ylab="Energy sub metering", xlab="")
lines(DateTime, SubMetering2, type="l", col="red")
lines(DateTime, SubMetering3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"), bty="o")
plot(DateTime, GlobalReactivePower, type="l", xlab="datetime", ylab="Global_reactive_power")

## Save the plot to the working directory
dev.copy(png, file="plot4.png", height=480, width=480)
dev.off()