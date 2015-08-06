#Exploratory Data Analysis - Assignment 1 -plot2

#Load data and subset Date = 1 feb 2007 and 2 Feb 2007
library(data.table)
Data <- read.table("household_power_consumption.txt",header=TRUE, sep=";")
Data <- subset(Data, Data$Date %in% c("1/2/2007" , "2/2/2007")) 

#make Date column to Date format & G_active_power to numeric value
Data$Date<-as.Date(Data$Date, "%d/%m/%Y")
Data$Global_active_power <- as.numeric(levels(Data$Global_active_power)[Data$Global_active_power])

##to let myself make sure 1feb2007 is THURS and 2feb2007 is FRI
#which_weekday<-format(Data$Date, "%a %d %b %Y")

#create another ONE column from Date and Time columns(from 9 to 10 columns)
#convert the new created column to Date-Time format
Data$DateTime <-paste(Data$Date,Data$Time, sep=" ")
Data$DateTime <-strptime(Data2$DateTime, format="%Y-%m-%d %H:%M:%S")

#Save file in PNG format with 480x480 dimension
#plot the graph in lines type
png(filename="plot2.png", width =480, height=480)
plot(Data$DateTime, Data$Global_active_power,
     type="l",          
     #col="black",
     lwd=0.5,
     ylab="Global Active Power (kilowatts)",
     xlab=""
     )
dev.off()
