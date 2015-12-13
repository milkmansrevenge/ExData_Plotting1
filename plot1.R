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

## Plot
hist(power_data$Global_active_power,
     col = "red",
     main = "Global Active Power", 
     xlab = "Global Active Power (kilowatts)")

## Save as PNG
dev.copy(png, file = "plot1.png", height=480, width=480)
dev.off()