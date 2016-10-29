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

par(mfrow= c(2,2))

# Plot 1 - Top Left Corner
with(data_subset, 
     plot(
         DateTime, 
         Global_active_power, 
         xlab = "", 
         type= "l",
         ylab="Global Active Power (kilowatts)"
     )
)

# Plot 2 - Top Right Corner



# Plot 3 - Bottom Right Corner


# Plot 4 - Bottom Left Corner
with(data_subset, 
     plot(DateTime, 
          Sub_metering_1, 
          type = "l",
          ylab="Energy sub metering",
          xlab=""
         )
)

with(data_subset, lines(DateTime, data_subset$Sub_metering_2, type="l", col= "red"))
with(data_subset, lines(DateTime, data_subset$Sub_metering_3, type="l", col= "blue"))

legend("topright", lty=1, lwd=2.5, col=c("black", "red","blue"), legend= c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"), cex = 0.75)

dev.copy(png, "plot3.png")
dev.off()
