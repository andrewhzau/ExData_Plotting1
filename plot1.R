

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

png("plot1.png", width=480, height=480)
hist(datIn$Global_active_power, col="red", 
     xlab="Global Active Power (kilowatts)",
     main="Global Active Power", axes=F)
axis(1)
axis(2, seq(0,1200, by=200))
dev.off()

