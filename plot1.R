plot1 <- function() {
  
  # reading data
  household_data <- read.delim("household_power_consumption.txt", sep=";")
  
  # restrict data.frame 2007-02-01 - 2007-02-02
  household_data$Date <- as.Date(household_data$Date, format="%d/%m/%Y")
  feb <- household_data[household_data$Date >= "2007-02-01" & 
                          household_data$Date < "2007-02-03",] 
  
  # plot and save png
  png("plot1.png", width = 480, height = 480)
  hist(as.numeric(as.character(feb$Global_active_power)), col="red", 
       xlab = "Gloabl Active Power (kilowatts)", main="Global Active Power")
  dev.off()
}