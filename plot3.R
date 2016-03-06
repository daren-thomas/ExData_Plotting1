# input data (houshold_power_consumption.txt), cleaned with script 'clean_data.R'
hpc_cleaned <- 'hpc_cleaned.txt'

df <- read.csv(hpc_cleaned)

library(lubridate)
df$DateTime <- ymd_hms(df$DateTime)

png(filename = 'plot3.png', width = 480, height = 480)

par(mfrow=c(1, 1))
plot(df$Sub_metering_1 ~ df$DateTime, col = 'black', ylab = 'Energy sub metering', type = "l", xlab='')
lines(df$Sub_metering_2 ~ df$DateTime, col = 'red')
lines(df$Sub_metering_3 ~ df$DateTime, col = 'blue')
legend('topright', c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'), 
       col = c('black', 'red', 'blue'), lty = 1)

dev.off()