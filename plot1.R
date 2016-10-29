setwd("C:/Users/Jonathan/Desktop/Coursera/4. Exploratory Data Analysis/Week 1 - Assignment/")
# getwd()

data <- read.csv("./Data/household_power_consumption.txt", sep=";", na.strings="?", stringsAsFactors=FALSE)
# class(data$Date) # Check the data type of column Date

data$Date <- as.Date( as.character(data$Date), "%d/%m/%Y" )
data_subset <- subset(data, Date >= "2007-02-01" & Date <= "2007-02-02")

# Remove variable to free some memory
rm("data")

# Visually check the data
# View(data_subset)

with(data_subset, 
     hist(
            Global_active_power, 
            main="Global Active Power", 
            xlab="Global Active Power (kilowatts)",
            col="red"
        )
    )

dev.copy(png, "plot1.png")
dev.off()
