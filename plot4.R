wd <- getwd()
dataFile <- 'household_power_consumption.txt'
dataPath <- paste0(wd,'/' , dataFile)

# Construct the plot and save it to a PNG file with a width of 480 pixels and a height of 
# 480 pixels.
##dates 2007-02-01 and 2007-02-02

# reading and checking raw data
raw <- read.table(dataPath, header = TRUE, sep = ';', stringsAsFactors=FALSE, dec=".")
head(raw)
dim(raw)
str(raw)

# subsetting data for the required period
dt <- subset(raw, raw$Date == '1/2/2007' | raw$Date == '2/2/2007')
head(dt)
dim(dt)
str(dt)

#converting to date and time format
dateTime <- paste(dt$Date, dt$Time)
t <- strptime(dateTime, '%d/%m/%Y %H:%M:%S')


png("plot4.png", width=480, height=480)
par(mfrow = c(2,2))
#plot1
plot(t, as.numeric(dt$Global_active_power), type = 'l', ylab = 'Global Active Power',
     xlab = '')
#plot2
plot(t, as.numeric(dt$Voltage), type = 'l', ylab = 'Voltage',
     xlab = 'datetime')
#plot3
plot(t, as.numeric(dt$Sub_metering_1), type = 'null', xlab = '', ylab = 'Energy sub metering')
lines(t, as.numeric(dt$Sub_metering_1), col = 'black')
lines(t, as.numeric(dt$Sub_metering_2), col = 'red')
lines(t, dt$Sub_metering_3, col = 'blue')
legend('topright',lty = 1, lwd=2.5, col = c('black', 'red', 'blue'), legend = c('Sub_metering1', 'Sub_metering2', 'Sub_metering3'))
#plot4
plot(t, as.numeric(dt$Global_reactive_power), type = 'l', ylab = 'Global_reactive_power',
     xlab = 'datetime')
dev.off()