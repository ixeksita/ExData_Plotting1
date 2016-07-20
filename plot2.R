library(dplyr)
library(sqldf)

#first load the data set
energy<- read.csv("household_power_consumption.txt", sep=";",
                  stringsAsFactors = FALSE,na.strings="?" )
energy$Date<-as.Date(energy$Date,"%d/%m/%Y")

#subsetting the dataset
energy1=subset(energy, Date>="2007-02-01" & Date<="2007-02-02")

#adding a datetime column (this will be used for the plots)
energy1<-mutate(energy1,datetime=as.POSIXct(paste(Date,Time), "%Y-%m-%d %H:%M%:%S"))

#generating plot2
png(filename="plot2.png", width = 480, height = 480, units = "px")
plot2<-plot(energy1$datetime, energy1$Global_active_power, 'l',
            ylab="Global Active Power [kilowatts]",
            xlab="")
dev.off()
