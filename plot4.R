rm(list=ls())
path <- "E:\\Yuexing\\Coursera\\Data Science Specialization\\Exploratory Data Analysis\\Project"
if(!file.exists(path))    dir.create(path)
setwd(path)

# need to clone the github repo to the local path provided above using git bash
# The folder is named "ExData_plotting1"

library(data.table)
library(dplyr)
library(lubridate)

data <- fread("household_power_consumption.txt", na.strings = "?")
subData <- subset(data, Date=="1/2/2007" | Date=="2/2/2007")
# create a new column that combines the date and time, and transform it into POSiXct format
subData <- subData %>%
  mutate(datetime = as.POSIXct(strptime(paste(Date, Time), "%d/%m/%Y %H:%M:%S"))) %>%
  select(datetime, Global_active_power:Sub_metering_3)

par(mfrow = c(2,2))
with(subData, {
  plot(datetime, Global_active_power, type = "n", xlab = "", ylab = "Global Active Power")
  lines(datetime, Global_active_power, lwd = 1)
  plot(datetime, Voltage, type = "n")
  lines(datetime, Voltage, lwd = 1)
  plot(datetime, Sub_metering_1, type = "n", xlab = "", ylab = "Energy sub metering")
  # bty = "n" strips off the border of the legend box
  legend("topright", lty = c(1,1,1), lwd = c(1,1,1), col = c("black","red","blue"),
        bty = "n", legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), 
        cex = 0.5, y.intersp = 0.3)
  lines(datetime, Sub_metering_1, lwd = 1)
  lines(datetime, Sub_metering_2, lwd = 1, col = "red")
  lines(datetime, Sub_metering_3, lwd = 1, col = "blue")
  plot(datetime, Global_reactive_power, type = "n")
  lines(datetime, Global_reactive_power, lwd = 1)
})
dev.copy(png, ".\\ExData_plotting1\\plot4.png")
dev.off()