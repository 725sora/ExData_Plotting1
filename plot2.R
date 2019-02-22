plot2 <- function() {
  
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
  
  # plot and save png
  png("plot2.png", width = 480, height = 480)
  plot(feb$DateTime, feb$Global_active_power, type="l", 
       ylab="Global Active Power (kilowatts)", xlab="")
  dev.off()
  }
