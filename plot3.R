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


#generating plot3
png(filename="plot3.png", width = 480,height=480, units="px")
plot(Sub_metering_1~datetime,data=energy1, type='l', xlab="",
     ylab="Energy sub metering")
lines(energy1$datetime, energy1$Sub_metering_2, col="maroon2")
lines(energy1$datetime,energy1$Sub_metering_3,col="cyan4")
legend("topright",c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"),
       col=c("black", "maroon2","cyan4"), lty=1, cex=0.8)
dev.off()
