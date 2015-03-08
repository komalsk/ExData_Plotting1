# Reading input dataset only for period from 2007-02-01 to 2007-02-02

file_read_plot3 <- read.csv.sql("household_power_consumption.txt", sql = "select * from file 
                                where Date in('1/2/2007','2/2/2007')", header = TRUE, sep= ";")

# Converting Date column values from character to Date format
conv_date <- as.Date(file_read_plot3$Date, "%d/%m/%Y")

# Combining above converted Date column with Time column present in input file
merge_DT <- paste(conv_date, file_read_plot3$Time, sep = " ")


# Converting above combined value to Date/Time format
conv_DateTime <- strptime(merge_DT, "%F %H:%M:%S")

# Adding new Date/Time column to dataset file_read_plot3
file_read_plot3 <- cbind(file_read_plot3, conv_DateTime)

# Writing plot3 to PNG file

png(filename = "plot3.png", width = 480, height = 480  )

# Creating plot3

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


dev.off()
