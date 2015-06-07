# download the data
download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", "data.zip")
file = unzip("data.zip")

# load the data
library(sqldf)
data = read.csv.sql(file, sql = "select * from file where Date in ('1/2/2007', '2/2/2007')", header = T, sep = ";")
data$datetime = as.POSIXlt(paste(data$Date, data$Time), format="%d/%m/%Y %H:%M:%S")

# construct the plot 2
png("plot2.png", width=480, height=480)
plot(data$datetime, data$Global_active_power, type = "l", xlab = "", ylab="Global Active Power (kilowatts)")
dev.off()
