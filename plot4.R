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
power_data$Date_time <- as.POSIXct(paste(power_data$Date, power_data$Time))

## Plot
par(mfrow=c(2,2))
with(power_data,{
    plot(Date_time,Global_active_power,type="l",
         ylab="Global Active Power (kilowatts)");
    
    plot(Date_time,Voltage,type="l");
    
    plot(Date_time,Sub_metering_1,type="l",ylab="Energy sub metering");
    lines(Date_time,Sub_metering_2,col="red");
    lines(Date_time,Sub_metering_3,col="blue");
    legend("topright",
           legend=c("sub_metering 1","sub_metering 2","sub_metering 3"),
           lty=c(1,1),
           col=c("black","red","blue"));
    
    plot(Date_time,Global_reactive_power,type="l",
         ylab="Global Reactive Power (kilowatts)");
    
})

## Save as PNG
dev.copy(png, file = "plot4.png", height=480, width=480)
dev.off()