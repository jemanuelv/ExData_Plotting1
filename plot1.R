setwd("D:/Repository/ExData_Plotting1")


# Read data table 
data <- read.table(file="data/household_power_consumption.txt",
                   header=TRUE, sep=";",
                   na.strings = "?")

# Subset data for 2007-02-01 and 2007-02-02
data <- data[data$Date=="1/2/2007"|data$Date=="2/2/2007",]

# Convert date and time to POSIX
data$DateTime <- strptime(paste(data$Date,data$Time), 
                          format="%d/%m/%Y %H:%M:%S")
# Remove unused columns
data$Date <- NULL; 
data$Time <- NULL; 

# Active png device
png(file= "plot1.png", width = 480, height = 480)

hist(data$Global_active_power, col="red", main="Global Active Power",
     xlab="Global Active Power (Kilowatts)")

# Close the PNG device
dev.off() 
     