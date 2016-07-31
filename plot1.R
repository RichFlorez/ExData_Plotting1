## Working directory & file location
setwd("~/datasciencecoursera/ExploratoryDataAnalysis/ProjectWk1/")

## Read the data file into memory
Data <- read.table("./household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")

## Subset the relevant data for the plot 
SubsetData <- Data[Data$Date %in% c("1/2/2007","2/2/2007") ,]
GlobalActivePower <- as.numeric(SubsetData$Global_active_power)

## Create the histogram
hist(GlobalActivePower, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")

## Save the plot to the working directory
dev.copy(png, file="plot1.png", height=480, width=480)
dev.off()
