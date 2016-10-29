setwd("C:/Users/Jonathan/Desktop/Coursera/4. Exploratory Data Analysis/Week 1 - Assignment/")
# getwd()

data <- read.csv("./Data/household_power_consumption.txt", sep=";", na.strings="?", stringsAsFactors=FALSE)
# class(data$Date) # Check the data type of column Date

data$Date <- as.Date( as.character(data$Date), "%d/%m/%Y" )
data_subset <- subset(data, Date >= "2007-02-01" & Date <= "2007-02-02")

# Remove variable to free some memory
rm("data")

data_subset$DateTime <- as.POSIXct(paste(data_subset$Date, data_subset$Time), format="%Y-%m-%d %H:%M:%S")

# Visually check the data
# View(data_subset)

with(data_subset, 
     plot(
         DateTime, 
         Global_active_power, 
         xlab = "", 
         type= "l",
         ylab="Global Active Power (kilowatts)"
     )
)

dev.copy(png, "plot2.png")
dev.off()
