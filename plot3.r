install.packages("sqldf")
library(sqldf)
df <- read.csv.sql("~/Boulot/Coursera/7.ExploratoryAnalysis/hpc.txt",sep=";",
                   sql = 'select * from file where Date="1/2/2007" OR  Date="2/2/2007"' )


df$DT<-strptime( paste(df$Date,df$Time, sep = " " ), format = '%d/%m/%Y %H:%M:%S')


# Label of day in english
Sys.setlocale("LC_ALL", "English")

## Plot3
png(filename="~/Boulot/Coursera/7.ExploratoryAnalysis/plot3.png", width = 480, height = 480, units = "px")

# Transparent background
par(bg=NA)
plot(df$DT, df$Sub_metering_1 ,xlab="",ylab="Energy sub metering",type="n")
lines (df$DT, df$Sub_metering_1 ,type="l",col="black")
lines (df$DT, df$Sub_metering_2 ,type="l",col="red")
lines (df$DT, df$Sub_metering_3 ,type="l",col="blue")
legend("topright",pch=c(NA,NA),col=c("black","red","blue"), lwd = 1,
       legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

dev.off()

