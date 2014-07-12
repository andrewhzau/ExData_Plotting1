
datName <- read.table("household_power_consumption.txt",
                      head=T, sep=";", as.is=T,
                      nrows=5)
datIn <- read.table("household_power_consumption.txt",
                    head=F, sep=";", as.is=T, skip=66637,
                    nrows=2880)
names(datIn) <- names(datName)
head(datIn)
sapply(datIn, class)
datIn$Global_active_power <- as.numeric(datIn$Global_active_power)
str(datIn$Global_active_power)

png("plot2.png", width=480, height=480)
plot(datIn$Global_active_power, type="l",
     xlab="", ylab="Global Active Power (kilowatts)",
     axes=F)
table(datIn$Date)
axis(1, c(1,1441, 2880), labels=c("Thu", "Fri", "Sat"))
axis(2)
box()
dev.off()

