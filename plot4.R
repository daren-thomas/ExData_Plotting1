# input data (houshold_power_consumption.txt), cleaned with script 'clean_data.R'
hpc_cleaned <- 'hpc_cleaned.txt'

df <- read.csv(hpc_cleaned)

library(lubridate)
df$DateTime <- ymd_hms(df$DateTime)

png(filename = 'plot4.png', width = 480, height = 480)

par(mfrow=c(2, 2))
plot(df$Global_active_power ~ df$DateTime, col = 'black', ylab = 'Global Active Power', type = "l", xlab='')

plot(df$Voltage ~ df$DateTime, col = 'black', type = "l", ylab='Voltage', xlab='datetime')

plot(df$Sub_metering_1 ~ df$DateTime, col = 'black', ylab = 'Energy sub metering', type = "l", xlab='')
lines(df$Sub_metering_2 ~ df$DateTime, col = 'red')
lines(df$Sub_metering_3 ~ df$DateTime, col = 'blue')
legend('topright', c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'), 
       col = c('black', 'red', 'blue'), lty = 1, bty='n')

plot(df$Global_reactive_power ~ df$DateTime, col = 'black', type = "l", ylab='Global_reactive_power', xlab='datetime')

dev.off()