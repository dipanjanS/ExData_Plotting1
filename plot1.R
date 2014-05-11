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

# Making the first plot and saving it to the png file
png(filename="plot1.png", width=480, height=480, units="px")
hist(df$global_active_power, col="red",  xlab="Global Active Power (kilowatts)", main="Global Active Power")
dev.off()
