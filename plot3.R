#Exploratory Data Analysis - Assignment 1 -plot3

#Load data and subset Date = 1 feb 2007 and 2 Feb 2007
library(data.table)
Data <- read.table("household_power_consumption.txt",header=TRUE, sep=";")
Data <- subset(Data, Data$Date %in% c("1/2/2007" , "2/2/2007")) 

#make Date column to Date format & G_active_power to numeric value
Data$Date<-as.Date(Data$Date, "%d/%m/%Y")
Data$Global_active_power <- as.numeric(levels(Data$Global_active_power)[Data$Global_active_power])

#create another ONE column from Date and Time columns(from 9 to 10 columns)
#convert the new created column to Date-Time format
Data$DateTime <-paste(Data$Date,Data$Time, sep=" ")
Data$DateTime <-strptime(Data$DateTime, format="%Y-%m-%d %H:%M:%S")

#make sub-metering_1,2 to nuumeric value
Data$Sub_metering_1 <- as.numeric(levels(Data$Sub_metering_1)[Data$Sub_metering_1])
Data$Sub_metering_2 <- as.numeric(levels(Data$Sub_metering_2)[Data$Sub_metering_2])


#Save file in PNG format with 480x480 dimension into current working directory
#plot the graph in lines type 
#plot first data then add second and 3rd data with "lines" command
png(filename="plot3.png", width =480, height=480)
plot(Data$DateTime, Data$Sub_metering_1,
     type="l",          
     col="black",
     lwd=0.5,
     ylab="Energy sub metering",
     xlab=""
)
lines(Data$DateTime, Data$Sub_metering_2,col="red", type="l")
lines(Data$DateTime, Data$Sub_metering_3,col="blue", type="l")
#define legend
legend("topright", legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       col=c("black","red","blue"), lty=1)
dev.off()
