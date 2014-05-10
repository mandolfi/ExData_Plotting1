setwd("C:\\Users\\Marco\\Documents\\GitHub\\ExData_Plotting1");

temp <- tempfile();
filepath <- "household_power_consumption.txt";

download.file("http://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip",temp)
con <- unz(temp, filepath);
data <- read.csv(con, sep = ";");
df <- subset(data, Date %in% c("1/2/2007", "2/2/2007"));
rm(data);
gc();

c <- as.character(df$Global_active_power);
v <- as.numeric(c);

strtstamp <- paste(df$Date, df$Time);
t <- strptime(strtstamp, "%d/%m/%Y %H:%M:%S");


v1 <- as.numeric(as.character(df$Sub_metering_1));
v2 <- as.numeric(as.character(df$Sub_metering_2));
v3 <- as.numeric(as.character(df$Sub_metering_3));
with(df, plot(t, v1, type="l", col="black", ylab="Energy sub metering", xlab=""));
with(df, lines(t, v2, type="l", col="red"));
with(df, lines(t, v3, type="l", col="blue"));
legend("topright",lty=1, col=c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"));
dev.copy(png, "plot3.png");
dev.off();
