# input data (houshold_power_consumption.txt), cleaned with script 'clean_data.R'
hpc_cleaned <- 'hpc_cleaned.txt'

df <- read.csv(hpc_cleaned)

library(lubridate)
df$DateTime <- ymd_hms(df$DateTime)

png(filename = 'plot2.png', width = 480, height = 480)
par(mfrow=c(1, 1))
plot(df$Global_active_power ~ df$DateTime, ylab = 'Global Active Power (kilowatts)', type = "l", xlab='')
dev.off()