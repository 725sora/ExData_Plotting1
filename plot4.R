plot4 <- function() {
  
  # reading data
  household_data <- read.delim("household_power_consumption.txt", sep=";")
  
  # make tidy data
  household_data$Date <- as.character(household_data$Date)
  household_data$Time <- as.character(household_data$Time)
  household_data$DateTime <- paste(household_data$Date,household_data$Time)
  household_data$Global_active_power <- 
    as.numeric(as.character(household_data$Global_active_power))
  
  # restrict data: 2007-02-01 - 2007-02-02
  household_data$DateTime <- as.character(household_data$DateTime)
  household_data$DateTime <- strptime(household_data$DateTime, format="%d/%m/%Y %H:%M:%S")
  feb <- household_data[as.Date(household_data$DateTime) >= "2007-02-01" & 
                          as.Date(household_data$DateTime) < "2007-02-03",] 
  
  # make further tidy data
  feb$Voltage <- as.numeric(as.character(feb$Voltage))
  feb$Global_reactive_power <- as.numeric(as.character(feb$Global_reactive_power))
  
  # plot and save png
  png("plot4.png", width = 480, height = 480)
  par(mfrow=c(2,2))
  
  # plot2 top left
  plot(feb$DateTime, feb$Global_active_power, type="l", 
       ylab="Global Active Power (kilowatts)", xlab="")
  
  # plot top right
  plot(feb$DateTime, feb$Voltage, ylab="Voltage", xlab="datetime", type="l")

  # plot3 down left 
  plot(feb$DateTime, feb$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
  lines(feb$DateTime, feb$Sub_metering_2, col="red")
  lines(feb$DateTime, feb$Sub_metering_3, col="blue")
  legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
         col=c("black", "red", "blue"), lty=1)
  
  # plot down right
  plot(feb$DateTime, feb$Global_reactive_power, type="l", xlab="datetime", 
       ylab="Global_reactive_power")
  dev.off()
  }