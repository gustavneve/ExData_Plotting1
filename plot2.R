##Assumes you have downloaded the zip file and extracted the text data file into the working directory

## Read full data set into an object
dataFULL<-read.csv(file="./household_power_consumption.txt",sep=";",nrows=2075259,na.strings="?",stringsAsFactors=F,check.names=F)

##convert Date field to Date/Time class
dataFULL$Date <- as.Date(dataFULL$Date, format="%d/%m/%Y")

##Create subset of the full data set
dataSUB<-subset(dataFULL, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))

##Delete full dataset to save memory
remove(dataFULL)

## create Datetime field
datetime <- paste(as.Date(dataSUB$Date), dataSUB$Time)
dataSUB$Datetime <- as.POSIXct(datetime)

## create PNG file
png(file="plot2.png",width=480,height=480)

## create plot2
plot(dataSUB$Global_active_power~dataSUB$Datetime, type="l",
     ylab="Global Active Power (kilowatts)", xlab="")


##Close PNG file
dev.off()