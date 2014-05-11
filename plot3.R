## @Author: Dipanjan Sarkar

# Uncomment the following line, change the path to the directory where you have the 'household_power_consumption.txt'
# file and use the setwd() command as shown below to set the working directory
#setwd('E:/MOOCs/Coursera/Data Science - Specialization/Exploratory Data Analysis/Course Project 1')

# Dataset name
filename <- 'household_power_consumption.txt'

# Column names and types
colNames <- c("date", "time", "global_active_power", "global_reactive_power", "voltage", "global_intensity", "sub_metering1", "sub_metering2", "sub_metering3")
colClasses = c("character", "character", rep("numeric",7) )

# Reading in the data
df <- read.table(filename, header=TRUE, sep=";", col.names=colNames, colClasses=colClasses, na.strings="?")

# converting column to Date type
df$date <- as.Date(df$date, format="%d/%m/%Y")
df <-  df[df$date >= as.Date("2007-02-01") & df$date<=as.Date("2007-02-02"),]

# Making the third plot and saving it to the png file
png(filename="plot3.png", width=480, height=480, units="px")
with(df, {
  plot(sub_metering1,type="l", xaxt="n", xlab="", ylab="Energy sub metering")
  lines(sub_metering2, col="red")
  lines(sub_metering3, col="blue")
})
mid <- length(df$date)/2
axis(1, at=c(1, mid, length(df$date)), labels=c("Thu", "Fri", "Sat"))
legend("topright", lty=1,lwd=2,cex=0.9, col=c("black", "red", "blue"), legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()