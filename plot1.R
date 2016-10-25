###############################################################
# Exploratory Data Analysis Week 1 Project
#
# plot1
#
###############################################################

#Import Data
source("getData.R")

#Create Plot 1 - Histogram
png(filename = "plot1.png", width = 480, height = 480 )
hist(electricDataSubset$Global_active_power,
     col = "red",
     xlab = "Global Active Power (kilowatts)",
     main = "Global Active Power",)
dev.off()