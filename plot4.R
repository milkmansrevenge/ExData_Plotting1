## Read data
data_file <- "..\\household_power_consumption.txt"
power_data <- read.table(data_file,
                         header = TRUE,
                         sep = ";",
                         na.strings = '?',
                         stringsAsFactors = TRUE)

## Set date format and extract the time period we are interested in
power_data$Date <- as.Date(power_data$Date,
                           format="%d/%m/%Y")
power_data <- subset(power_data,
                     subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))

## Combine date and time
power_data$datetime <- as.POSIXct(paste(power_data$Date, power_data$Time))

## Plot
png(file = "plot4.png", height = 480, width = 480,
    bg = "transparent", antialias = "cleartype")
par(mfrow=c(2, 2))
with(power_data,{
    plot(datetime, Global_active_power, type="l",
         ylab = "Global Active Power",
         xlab = "");
    
    plot(datetime, Voltage, type = "l");
    
    plot(datetime, Sub_metering_1, type = "l",
         ylab = "Energy sub metering", xlab = "");
    lines(datetime, Sub_metering_2, col = "red");
    lines(datetime, Sub_metering_3, col = "blue");
    legend("topright",
           legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
           lty = c(1, 1),
           bty = "n",
           col = c("black", "red", "blue"));
    
    plot(datetime,Global_reactive_power,type="l",
         ylab="Global_reactive_power");
    
})
dev.off()