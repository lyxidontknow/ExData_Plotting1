rm(list=ls())
path <- "E:\\Yuexing\\Coursera\\Data Science Specialization\\Exploratory Data Analysis\\Project"
if(!file.exists(path))    dir.create(path)
setwd(path)

# need to clone the github repo to the local path provided above using git bash
# The folder is named "ExData_plotting1"

library(data.table)
library(dplyr)
library(datasets)

data <- fread("household_power_consumption.txt", na.strings = "?")
subData <- subset(data, Date=="1/2/2007" | Date=="2/2/2007")
# create a new column that combines the date and time, and transform it into POSIXct format
subData <- subData %>%
  mutate(datetime = as.POSIXct(strptime(paste(Date, Time), "%d/%m/%Y %H:%M:%S"))) %>%
  select(datetime, Global_active_power:Sub_metering_3)

hist(subData$Global_active_power, main = "Global Active Power", xlab = "Global Active Power (kilowatts)",
     col = "red")
dev.copy(png, file = ".\\ExData_Plotting1\\plot1.png")
dev.off()


