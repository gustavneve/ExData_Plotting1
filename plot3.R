##Assumes you have downloaded the zip file and extracted the text data file into the working directory

## Read full data set into an object
dataFULL<-read.csv(file="./household_power_consumption.txt",sep=";",nrows=2075259,na.strings="?",stringsAsFactors=F,check.names=F)

##convert Date field to Date/Time class
dataFULL$Date <- as.Date(dataFULL$Date, format="%d/%m/%Y")

##Create subset of the full data set
dataSUB<-subset(dataFULL, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))

##Delete full dataset to save memory
remove(dataFULL)

## create date time
datetime <- paste(as.Date(dataSUB$Date), dataSUB$Time)
dataSUB$Datetime <- as.POSIXct(datetime)

##create png file
png(file="plot3.png",width=480,height=480)

##create plot3
plot(dataSUB$Sub_metering_1~dataSUB$Datetime, type="l",
     ylab="Energy sub metering", xlab="")
lines(dataSUB$Sub_metering_2~dataSUB$Datetime,col='Red')
lines(dataSUB$Sub_metering_3~dataSUB$Datetime,col='Blue')
legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, 
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

##complete PNG file with dev.off
dev.off()