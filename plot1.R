hpc <- read.table('c:/household_power_consumption.txt', sep=';', header=T, 
                   colClasses = c('character', 'character', 'numeric',
                                  'numeric', 'numeric', 'numeric',
                                  'numeric', 'numeric', 'numeric'), na.strings='?')

hpc$DateTime <- strptime(paste(hpc$Date, hpc$Time), "%d/%m/%Y %H:%M:%S")
hpc <- subset(hpc, as.Date(DateTime) >= as.Date("2007-02-01") & as.Date(DateTime) <= as.Date("2007-02-02"))

png("plot1.png", height=480, width=480)

# Build histogram
hist(hpc$Global_active_power, col='red', 
     xlab = 'Global Active Power (kilowatts)',
     main = 'Global Active Power')

# Close PNG file
dev.off()