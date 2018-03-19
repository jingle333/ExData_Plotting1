##reads the text file into a data table
p1 <- read.table("hpc.txt", header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
##subsets the data into rows between 1/2/2007 and 2/2/2007 from the Data column
subsetp1 <- p1[p1$Date %in% c("1/2/2007","2/2/2007") ,]

##coerces the Global_active_power column to numeric
gap <- as.numeric(subsetp1$Global_active_power)
png("plot1.png", width=480, height=480)
hist(gap, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()
