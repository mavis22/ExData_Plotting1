# Plot 2
library(sqldf)
# Path of the input file
inf<-"/Users/Mavis/Downloads/household_power_consumption.txt"
f<-file(inf)
# Using SQL to read rows meet the conditions
hpc<-sqldf("select * from f where Date == '1/2/2007' or Date == '2/2/2007'", file.format=list(header=TRUE, sep=";"))
close(f)

# Deal with date-time format
hpc$Date<-as.Date(hpc$Date, format="%d/%m/%Y")
dt<-paste(hpc$Date,hpc$Time)
dt<-strptime(dt,format="%F %T")
plot(dt,as.numeric((hpc$Global_active_power)),lty=1,type="l",ylab="Global Active Power (kilowatts)", xlab='')

# Copy and save to png file
dev.copy(png, file="plot2.png")
dev.off()