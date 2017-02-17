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

png("plot2.png", width=480, height=480)
plot(t, as.numeric(dt$Global_active_power), type = 'l', ylab = 'Global Active Power (killowatts)',
     xlab = '')
dev.off()
