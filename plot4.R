###############################################################
# Exploratory Data Analysis Week 1 Project
#
# plot4
#
###############################################################

#Import Data
source("getData.R")

#Format Data
electricGather <- gather(electricDataSubset,"Submeter","SubmeterEnergy", Sub_metering_1:Sub_metering_3, na.rm = TRUE, factor_key = TRUE)

#Create Plot 4
png(filename = "plot4.png", width = 480, height = 480 )
par(mfrow = c(2,2))

#Plot 4.1
with(electricDataSubset,plot(DateTime,Global_active_power,
                             type = "l",
                             xlab = "",
                             ylab = "Global Active Power (kilowatts)")
)

#Plot 4.2
with(electricDataSubset,plot(DateTime,Voltage,type="l"))

#Plot 4.3
with(electricGather,plot(DateTime,SubmeterEnergy,
                         type = "n",
                         xlab = "",
                         ylab = "Energy sub metering")
)
with(subset(electricGather, Submeter == "Sub_metering_1"),lines(DateTime, SubmeterEnergy, col="black"))
with(subset(electricGather, Submeter == "Sub_metering_2"),lines(DateTime, SubmeterEnergy, col="red"))
with(subset(electricGather, Submeter == "Sub_metering_3"),lines(DateTime, SubmeterEnergy, col="blue"))
legend("topright", lty = c(1,1,1), col = c("black", "red", "blue"), legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

#Plot 4.4
with(electricDataSubset,plot(DateTime,Global_reactive_power,type="l"))

dev.off()

#Cleanup
rm(electricGather)