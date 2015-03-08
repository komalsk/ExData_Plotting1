# Reading input dataset only for period from 2007-02-01 to 2007-02-02

file_read_plot2 <- read.csv.sql("household_power_consumption.txt", sql = "select * from file 
                          where Date in('1/2/2007','2/2/2007')", header = TRUE, sep= ";")

# Converting Date column values from character to Date format
conv_date <- as.Date(file_read_plot2$Date, "%d/%m/%Y")

# Combining above converted Date column with Time column present in input file
merge_DT <- paste(conv_date, file_read_plot2$Time, sep = " ")


# Converting above combined value to Date/Time format
conv_DateTime <- strptime(merge_DT, "%F %H:%M:%S")

# Adding new Date/Time column to dataset file_read_plot2
file_read_plot2 <- cbind(file_read_plot2, conv_DateTime)


# Creating plot2

plot(file_read_plot2$conv_DateTime, 
     file_read_plot2$Global_active_power, 
     type = "l", 
     ylab = "Global Active Power (kilowatts)", 
     xlab = " ")


# Writing plot2 to PNG file

dev.copy(png, 
         file = "plot2.png", 
         width = 480,
         height = 480)

dev.off()


