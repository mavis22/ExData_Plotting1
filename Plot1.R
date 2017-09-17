# Plot 1
library(sqldf)
# Path of the input file
inf<-"/Users/Mavis/Downloads/household_power_consumption.txt"
f<-file(inf)
# Using SQL to read rows meet the conditions
hpc<-sqldf("select * from f where Date == '1/2/2007' or Date == '2/2/2007'", file.format=list(header=TRUE, sep=";"))
close(f)

# Drawing plot 1
hist(as.numeric(hpc$Global_active_power), col="red",ylab="Frequency",xlab="Global Active Power (kilowatts)",main="Global Active Power")
# Copy and save to png file
dev.copy(png, file="plot1.png")
dev.off()