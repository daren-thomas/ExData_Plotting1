# read in the data, clean it and save only the days we need to disk

houshold_power_consumption_txt <- '/Users/darthoma/Downloads/household_power_consumption.txt'
df <- read.csv(houshold_power_consumption_txt, sep=';')
df$Date = as.Date(df$Date, '%d/%m/%Y')
df$Time <- strptime(df$Time, '%H:%M:%S')

df <- subset(df, Date >= as.Date('2007-02-01') & Date <= as.Date('2007-02-02'))
write.csv(df, 'hpc_cleaned.txt')