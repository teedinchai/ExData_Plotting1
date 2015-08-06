#Exploratory Data Analysis - Assignment 1

#Load data and subset Date = 1 feb 2007 and 2 Feb 2007
library(data.table)
#DT <- fread("household_power_consumption.txt")
Data <- read.table("household_power_consumption.txt",header=TRUE, sep=";")
Data <- subset(Data, Data$Date %in% c("1/2/2007" , "2/2/2007")) 

Data$Date<-as.Date(Data$Date, "%d/%m/%Y")
Data$Global_active_power <- as.numeric(levels(Data$Global_active_power)[Data$Global_active_power])

# save in png filewith size 480x480
png(filename="plot1.png", width =480, height=480)
#draw graph in histogram format
hist(Data$Global_active_power,
     breaks=11,
     xlab= "Global Active Power (kilowatts)",
     main="Global Active Power",
     cex.axis= 1,
     cex.lab= 1,
     cex.main= 1.2,
     col= "red",
     ylim= c(0,1200)
    )
#off save png file
dev.off()

