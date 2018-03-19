##reads the text file into a data table
p1 <- read.table("hpc.txt", header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
##subsets the data into rows between 1/2/2007 and 2/2/2007 from the Data column
subsetp1 <- p1[p1$Date %in% c("1/2/2007","2/2/2007") ,]

##concatenates the date and time column into a new column in a d/m/y h:m:s format
p1_Date_Time <- strptime(paste(subsetp1$Date, subsetp1$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
##coerces the Global_active_power column to numeric
gap <- as.numeric(subSetData$Global_active_power)
##coerces the Sub metering columns to numeric
SM1 <- as.numeric(subsetp1$Sub_metering_1)
SM2 <- as.numeric(subsetp1$Sub_metering_2)
SM3 <- as.numeric(subsetp1$Sub_metering_3)

png("plot3.png", width=480, height=480)
plot(p1_Date_Time, SM1, type="l", ylab="Energy Submetering", xlab="")
lines(p1_Date_Time, SM2, type="l", col="red")
lines(p1_Date_Time, SM3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))
dev.off()
