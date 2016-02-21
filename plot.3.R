## COURSERA DATA SCIENCE SPECIALIZATION BY JOHNS HOPKINS UNIVERSITY

## EXPLORATORY DATA ANALYSIS COURSE

## ASSIGNMENT: COURSE PROJECT 1

## 1. Loading data:

## Reading database file using fread function, much faster than read.table:

library(data.table)

df <- fread(input = "./household_power_consumption.txt",
            header = TRUE,
            sep = ";",
            colClasses = c("character", "character", rep("numeric",7)),
            na = "?")

## Filtering those observations beloging to 1/2/2007 and 2/2/2007:

sub <- subset(df, df$Date == "1/2/2007" | Date == "2/2/2007")

## Changing Date column class from character to date:

## Converting Date and Time variables to Date/Time classes using the strptime function:

DateTime <- paste(sub$Date, sub$Time, sep=" ")

sub$DateTime <- strptime(DateTime, "%d/%m/%Y %H:%M:%S")

## Attaching variables:

attach(sub)

## 2. Setting graphic device:

png(filename = "plot3.png",
    units = "px",
    width = 480,
    height = 480)

## 3. Making plot 3:

plot(DateTime, Sub_metering_1, 
     type = "l",
     col = "black",
     xlab = "", ylab = "Energy sub metering")

lines(DateTime, Sub_metering_2, col = "red")

lines(DateTime, Sub_metering_3, col = "blue")

legend("topright", 
       col = c("black", "red", "blue"),
       c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       lwd = 1)

dev.off()