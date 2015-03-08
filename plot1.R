# Reading input dataset only for period from 2007-02-01 to 2007-02-02

# string comparison of date value also works for plot1; i.e. Date/Time conversion is not needed
# I have converted the string Date and Time column to Date/Time format in polt2, plot3 and plot4

file_read_plot1 <- read.csv.sql("household_power_consumption.txt", sql = "select * from file 
                          where Date in('1/2/2007','2/2/2007')", header = TRUE, sep= ";")

# Creating plot1

hist(file_read_plot1$Global_active_power, 
     col = "red", 
     main = "Global Active Power", 
     xlab = "Global Active Power (kilowatts)")

# Writing plot1 to PNG file

dev.copy(png, 
         file = "plot1.png", 
         width = 480,
         height = 480)

dev.off()

