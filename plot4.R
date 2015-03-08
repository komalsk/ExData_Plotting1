# Reading input dataset only for period from 2007-02-01 to 2007-02-02

file_read_plot4 <- read.csv.sql("household_power_consumption.txt", sql = "select * from file 
                                where Date in('1/2/2007','2/2/2007')", header = TRUE, sep= ";")

# Converting Date column values from character to Date format
conv_date <- as.Date(file_read_plot4$Date, "%d/%m/%Y")

# Combining above converted Date column with Time column present in input file
merge_DT <- paste(conv_date, file_read_plot4$Time, sep = " ")


# Converting above combined value to Date/Time format
conv_DateTime <- strptime(merge_DT, "%F %H:%M:%S")

# Adding new Date/Time column to dataset file_read_plot4
file_read_plot4 <- cbind(file_read_plot4, conv_DateTime)

# Writing plot4 to PNG file

png(filename = "plot4.png", width = 480, height = 480  )

# Creating plot4

par(mfrow = c(2, 2))

plot(file_read_plot4$conv_DateTime, 
     file_read_plot4$Global_active_power, 
     type = "l", 
     ylab = "Global Active Power (kilowatts)", 
     xlab = " ")


plot(file_read_plot4$conv_DateTime, 
     file_read_plot4$Voltage, 
     type = "l", 
     ylab = "Voltage", 
     xlab = "datetime")


plot(file_read_plot3$conv_DateTime, 
     file_read_plot3$Sub_metering_1, 
     type = "l", 
     ylab = "Energy sub metering", 
     xlab = " ")
lines(file_read_plot3$conv_DateTime, 
      file_read_plot3$Sub_metering_2, 
      col = "red")
lines(file_read_plot3$conv_DateTime, 
      file_read_plot3$Sub_metering_3, 
      col = "blue")

legend("topright", 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       lty = 1, 
       col = c("black", "red", "blue"),
       xjust = 1)


plot(file_read_plot4$conv_DateTime, 
     file_read_plot4$Global_reactive_power, 
     type = "l", 
     ylab = "Global_reactive_power", 
     xlab = "datetime")

dev.off()
