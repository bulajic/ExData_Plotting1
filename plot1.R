# download the data
download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", "data.zip")
file = unzip("data.zip")

# load the data
library(sqldf)
data = read.csv.sql(file, sql = "select * from file where Date in ('1/2/2007', '2/2/2007')", header = T, sep = ";")

# construct the plot 1
png("plot1.png", width=480, height=480)
hist(data$Global_active_power, col="red", xlab="Global Active Power (kilowatts)", main="Global Active Power")
dev.off()
