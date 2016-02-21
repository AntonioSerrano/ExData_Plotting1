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

png(filename = "plot2.png",
    units = "px",
    width = 480,
    height = 480)

## 3. Making plot 2:

plot(DateTime, Global_active_power, 
     type = "l",
     xlab = "",
     ylab = "Global Active Power (kilowatts)")

dev.off()