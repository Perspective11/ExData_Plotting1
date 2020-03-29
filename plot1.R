# Read the data from the file, separate values by ";", Identify the "?" value as NA, Define column Classes
gdpdata <- read.csv("./household_power_consumption.txt", sep = ";", na.strings = c("?"), colClasses = c(NA, NA, "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric"))

# Created a filter for only the dates 01-02-2007 and 02-02-2007
datefilter <- gdpdata$Date == "1/2/2007" | gdpdata$Date == "2/2/2007"

# Applied the filter to the dataset
gdpdata <- gdpdata[datefilter,]

# Convert the Time column to an object of date and time
gdpdata$Time <- strptime(paste(gdpdata$Date, gdpdata$Time), "%d/%m/%Y %H:%M:%S")

# Convert the Date column to a date object
gdpdata$Date <- as.Date(gdpdata$Date, "%d/%m/%Y")

# Open a png graphic device for the plot with specific width and height
png("plot1.png", width = 480, height = 480)

# Define the global graphic parameter, to allow only one graph in the canvas
par(mfrow = c(1,1))

hist(gdpdata$Global_active_power, xlab = "Global Active Power (kilowatts)", main = "Global Active Power", col = "red")

# Close the png graphic device to save the plot
dev.off()
