###############################################################
# Exploratory Data Analysis Week 1 Project
#
# plot2
#
###############################################################

#Import Data
source("getData.R")

#Create Plot 2
png(filename = "plot2.png", width = 480, height = 480 )
with(electricDataSubset,plot(DateTime,Global_active_power,
     type = "l",
     xlab = "",
     ylab = "Global Active Power (kilowatts)")
)
dev.off()