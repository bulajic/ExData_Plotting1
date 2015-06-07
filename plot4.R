# download the data
download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", "data.zip")
file = unzip("data.zip")

# load the data
library(sqldf)
data = read.csv.sql(file, sql = "select * from file where Date in ('1/2/2007', '2/2/2007')", header = T, sep = ";")
data$datetime = as.POSIXlt(paste(data$Date, data$Time), format="%d/%m/%Y %H:%M:%S")
attach(data)

# construct the plot 4
png("plot4.png", width=480, height=480)
par(mfcol = c(2, 2))
# top left
plot(datetime, Global_active_power, type = "l", xlab = "", ylab="Global Active Power")
# bottom left
plot(datetime, Sub_metering_1, type = "l", ylab="Energy sub metering", xlab="")
lines(datetime, Sub_metering_2, col="red")
lines(datetime, Sub_metering_3, col="blue")
legend('topright', names(data)[7:9], lty=1, col=c('black', 'red', 'blue'), bty="n", cex=0.9)
# top right
plot(datetime, Voltage, type = "l")
# bottom right
plot(datetime, Global_reactive_power, type = "l")
dev.off()
