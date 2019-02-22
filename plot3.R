plot3 <- function() {
  
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
  feb$Sub_metering_1 <- as.numeric(as.character(feb$Sub_metering_1))
  feb$Sub_metering_2 <- as.numeric(as.character(feb$Sub_metering_2))
  feb$Sub_metering_3 <- as.numeric(as.character(feb$Sub_metering_3))
  
  # plot data and save png  
  png("plot3.png", width = 480, height = 480)
  plot(feb$DateTime, feb$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
  lines(feb$DateTime, feb$Sub_metering_2, col="red")
  lines(feb$DateTime, feb$Sub_metering_3, col="blue")
  legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
         col=c("black", "red", "blue"), lty=1)
  dev.off()
  }