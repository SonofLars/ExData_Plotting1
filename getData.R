###############################################################
# Exploratory Data Analysis Week 1 Project
#
# This script checks if the needed dataset exists
# If the dataset does not exist it creates it
#
###############################################################


if(!(exists("electricDataSubset") && is.data.frame(get("electricDataSubset")))){
  
  #Filename of Zip file downloaded
  dlFilename <- "exdata_data_household_power_consumption.zip"
  
  #Check if zip file exists. If not, download it
  if(!file.exists(dlFilename)){
    dataURL <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
    download.file(dataURL,dlFilename)
  }
  
  #Get the filename of the datafile that is zipped up
  dataFile <- toString(unzip(dlFilename,list=TRUE)[1])
  
  #Check if unzipped data file exists
  if(!file.exists(dataFile)){
    unzip(dlFilename)
  }
  
  #Read the data then subset for dates of interest, remove original dataset to save memory
  electricData <- read.table(dataFile,header = TRUE, sep =";",na.strings="?")
  electricDataSubset <- electricData[electricData$Date %in% c("1/2/2007","2/2/2007"),]
  rm(electricData)
  
  #Convert data/time variables
  library(lubridate)
  electricDataSubset$DateTime <- as.POSIXct(with(electricDataSubset, dmy(Date) + hms(Time)))
  
  #Cleanup
  rm(dataFile,dlFilename)
}

