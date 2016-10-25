###############################################################
# Exploratory Data Analysis Week 1 Project
#
# plot3
#
###############################################################

#Import Data
source("getData.R")

#Format Data
electricGather <- gather(electricDataSubset,"Submeter","SubmeterEnergy", Sub_metering_1:Sub_metering_3, na.rm = TRUE, factor_key = TRUE)

#Create Plot 3
png(filename = "plot3.png", width = 480, height = 480 )
with(electricGather,plot(DateTime,SubmeterEnergy,
                             type = "n",
                             xlab = "",
                             ylab = "Energy sub metering")
)
with(subset(electricGather, Submeter == "Sub_metering_1"),lines(DateTime, SubmeterEnergy, col="black"))
with(subset(electricGather, Submeter == "Sub_metering_2"),lines(DateTime, SubmeterEnergy, col="red"))
with(subset(electricGather, Submeter == "Sub_metering_3"),lines(DateTime, SubmeterEnergy, col="blue"))
legend("topright", lty = c(1,1,1), col = c("black", "red", "blue"), legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
dev.off()

#Cleanup
rm(electricGather)