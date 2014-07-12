
datName <- read.table("household_power_consumption.txt",
                      head=T, sep=";", as.is=T,
                      nrows=5)
datIn <- read.table("household_power_consumption.txt",
                    head=F, sep=";", as.is=T, skip=66637,
                    nrows=2880)
names(datIn) <- names(datName)
head(datIn)
sapply(datIn, class)

datIn$Sub_metering_1 <- as.numeric(datIn$Sub_metering_1)
datIn$Sub_metering_2 <- as.numeric(datIn$Sub_metering_2)
datIn$Sub_metering_3 <- as.numeric(datIn$Sub_metering_3)
png("plot3.png", width=480, height=480)
plot(datIn$Sub_metering_1, type="l",
     xlab="", ylab="Energy sub metering",
     axes=F)
lines(datIn$Sub_metering_2, col="red")
lines(datIn$Sub_metering_3, col="blue")
table(datIn$Date)
axis(1, c(1,1441, 2880), labels=c("Thu", "Fri", "Sat"))
axis(2)
box()
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       col=c("black", "red", "blue"), lwd=1)
dev.off()

