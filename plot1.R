library(dplyr)
library(sqldf)

#first load the data set
energy<- read.csv("household_power_consumption.txt", sep=";",
                  stringsAsFactors = FALSE,na.strings="?" )
energy$Date<-as.Date(energy$Date,"%d/%m/%Y")

#subsetting the dataset
energy1=subset(energy, Date>="2007-02-01" & Date<="2007-02-02")

#adding a datetime column (this will be used for the plots)
energy1<-mutate(energy1,datetime=as.POSIXct(paste(Date,Time), "%Y-%m-%d %H:%M%:%S", tz="GMT"))

#generating plot1
png(filename="plot1.png", width = 480,height=480, units="px")
plot1<-hist(energy1$Global_active_power, col="darkslateblue",
            main="Global Active power", xlab="Global ACtive Power (kilowatts)")
dev.off()
