install.packages("sqldf")
library(sqldf)
df <- read.csv.sql("~/Boulot/Coursera/7.ExploratoryAnalysis/hpc.txt",sep=";",
                   sql = 'select * from file where Date="1/2/2007" OR  Date="2/2/2007"' )


df$DT<-strptime( paste(df$Date,df$Time, sep = " " ), format = '%d/%m/%Y %H:%M:%S')

# Label of day in english
Sys.setlocale("LC_ALL", "English")

## Plot4

png(filename="~/Boulot/Coursera/7.ExploratoryAnalysis/plot4.png", width = 480, height = 480, units = "px")

# Transparent background
par(bg=NA)

## Plot4

par(mfcol=c(2,2),mar=c(4,4, 2, 1),oma=c(2,1, 1, 1))
## col 1 row 1
plot(df$DT, df$Global_active_power,xlab="",ylab="Global Active Power (kilowatts)",type="l")
## col 1 row 2
plot(df$DT, df$Sub_metering_1 ,xlab="",ylab="Energy sub metering",type="n")
lines (df$DT, df$Sub_metering_1 ,type="l",col="black")
lines (df$DT, df$Sub_metering_2 ,type="l",col="red")
lines (df$DT, df$Sub_metering_3 ,type="l",col="blue")
legend("topright",pch=c(NA,NA),col=c("black","red","blue"), lwd = 1, cex = 0.75,box.lty=0, inset=.02,
       legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
## col 2 row 1
plot(df$DT, df$Voltage,ylab="Voltage",xlab="datetime",type="l")
## col 2 row 2
plot(df$DT, df$Global_reactive_power,ylab="Global reactive power",xlab="datetime",type="l")


dev.off()

