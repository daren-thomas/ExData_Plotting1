# input data (houshold_power_consumption.txt), cleaned with script 'clean_data.R'
hpc_cleaned <- 'hpc_cleaned.txt'

df <- read.csv(hpc_cleaned)

png(filename = 'plot1.png', width = 480, height = 480)
par(mfrow=c(1, 1))
hist(df$Global_active_power, col = 'red', 
     xlab = 'Global Active Power (kilowatts)', 
     main = 'Global Active Power')
dev.off()