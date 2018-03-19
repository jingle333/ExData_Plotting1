##reads the text file into a data table
p1 <- read.table("hpc.txt", header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
##subsets the data into rows between 1/2/2007 and 2/2/2007 from the Data column
subsetp1 <- p1[p1$Date %in% c("1/2/2007","2/2/2007") ,]

##concatenates the date and time column into a new column in a d/m/y h:m:s format
p1_Date_Time <- strptime(paste(subsetp1$Date, subsetp1$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
##coerces the Global_active_power column to numeric
gap <- as.numeric(subSetData$Global_active_power)

png("plot2.png", width=480, height=480)
plot(p1_Date_Time, gap, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()
