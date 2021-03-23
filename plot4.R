# setwd("D:/Repository/ExData_Plotting1")
# Sys.setlocale("LC_ALL", "English")

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
png(file= "plot4.png", width = 480, height = 480)

# Configure 2x2 plot
par(mfrow=c(2, 2), mar=c(4,4,1,2))

# Plot graph 1
with (data, plot(Global_active_power, x=DateTime, type="l", 
                 ylab="Global Active Power (kilowatts)", xlab=""))

# Plot graph 2
with (data, plot(Voltage, x=DateTime, type="l", 
                 ylab="Voltage"))

# Plot graph 3
with (data, 
      {plot(DateTime, Sub_metering_1, type="l", ylab="Energy sub metering", 
       xlab="")
      points(DateTime, Sub_metering_2, type="l", col="red")
      points(DateTime, Sub_metering_3, type="l", col="blue")}
      )
legend("topright",  lwd=2, col=c("black", "red", "blue"), 
       legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

# Plot graph 4
with (data, plot(Global_reactive_power, x=DateTime, type="l", 
                 ylab="Global_reactive_power"))

# Close the PNG device
dev.off() 
     