# Plot 3
library(sqldf)
# Path of the input file
inf<-"/Users/Mavis/Downloads/household_power_consumption.txt"
f<-file(inf)
# Using SQL to read rows meet the conditions
hpc<-sqldf("select * from f where Date == '1/2/2007' or Date == '2/2/2007'", file.format=list(header=TRUE, sep=";"))
close(f)


# Drawing Plot 3
plot(dt,hpc$Sub_metering_1,type="l",col="black",ylab="Energy sub metering",xlab='')
lines(dt,hpc$Sub_metering_2,type="l",col="red")
lines(dt,hpc$Sub_metering_3,type="l",col="blue")
legend("topright", legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col=c("black","red","blue"), lty=1)



# Copy and save to png file
dev.copy(png, file="plot3.png")
dev.off()