# read in the data, clean it and save only the days we need to disk
# data was obtained from here: https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip,
# saved to downloads folder and extracted there, resulting in the following file:
houshold_power_consumption_txt <- '/Users/darthoma/Downloads/household_power_consumption.txt'

# read in the dataset
df <- read.csv(houshold_power_consumption_txt, sep=';', na.strings = '?')

# update the columns for Date and Time
library(lubridate)
df$Date = as.Date(df$Date, '%d/%m/%Y')
df$DateTime = ymd_hms(paste(df$Date, df$Time))
df$Time <- strptime(df$Time, '%H:%M:%S')


# write out a new, much smaller data frame for creating the plots from...
df <- subset(df, Date >= as.Date('2007-02-01') & Date <= as.Date('2007-02-02'))
write.csv(df, 'hpc_cleaned.txt')