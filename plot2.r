install.packages("sqldf")
library(sqldf)
df <- read.csv.sql("~/Boulot/Coursera/7.ExploratoryAnalysis/hpc.txt",sep=";",
                   sql = 'select * from file where Date="1/2/2007" OR  Date="2/2/2007"' )


df$DT<-strptime( paste(df$Date,df$Time, sep = " " ), format = '%d/%m/%Y %H:%M:%S')

# Label of day in english
Sys.setlocale("LC_ALL", "English")

## Plot2

png(filename="~/Boulot/Coursera/7.ExploratoryAnalysis/plot2.png", width = 480, height = 480, units = "px")

# Transparent background
par(bg=NA)
plot(df$DT, df$Global_active_power,xlab="",ylab="Global Active Power (kilowatts)",type="l")

dev.off()

