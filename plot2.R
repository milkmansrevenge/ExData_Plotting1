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

## Plot to PNG
png(file = "plot2.png", height = 480, width = 480, bg = "transparent")
plot(power_data$Global_active_power ~ power_data$Date_time,
     type= "l",
     ylab= "Global Active Power",
     xlab = "")
dev.off()