##Assumes you have downloaded the zip file and extracted the text data file into the working directory

## Read full data set into an object
dataFULL<-read.csv(file="./household_power_consumption.txt",sep=";",nrows=2075259,na.strings="?",stringsAsFactors=F,check.names=F)

##convert Date field to Date/Time class
dataFULL$Date <- as.Date(dataFULL$Date, format="%d/%m/%Y")

##Create subset of the full data set
dataSUB<-subset(dataFULL, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))

##Delete full dataset to save memory
remove(dataFULL)

## Converting dates
datetime <- paste(as.Date(dataSUB$Date), dataSUB$Time)
dataSUB$Datetime <- as.POSIXct(datetime)

##create PNG file
png(file="plot4.png",width=480,height=480)

##create plot4
par(mfrow=c(2,2),mar=c(4,4,2,1), oma=c(0,0,2,0))
  plot(dataSUB$Global_active_power~dataSUB$Datetime, type="l",
       ylab="Global Active Power", xlab="")
  plot(dataSUB$Voltage~dataSUB$Datetime, type="l", 
       ylab="Voltage", xlab="")
  plot(dataSUB$Sub_metering_1~dataSUB$Datetime, type="l", 
       ylab="Energy sub metering", xlab="")
  lines(dataSUB$Sub_metering_2~dataSUB$Datetime,col='Red')
  lines(dataSUB$Sub_metering_3~dataSUB$Datetime,col='Blue')
  legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, bty="n",
         legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
  plot(dataSUB$Global_reactive_power~dataSUB$Datetime, type="l", 
       ylab="Global_reactive_power",xlab="")


##close PNG file
dev.off()