setwd("C:\\Users\\Marco\\Documents\\GitHub\\ExData_Plotting1");

temp <- tempfile();
filepath <- "household_power_consumption.txt";

download.file("http://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip",temp)
con <- unz(temp, filepath);
data <- read.csv(con, sep = ";");
df <- subset(data, Date %in% c("1/2/2007", "2/2/2007"));
rm(data);
gc();

strtstamp <- paste(df$Date, df$Time);
t <- strptime(strtstamp, "%d/%m/%Y %H:%M:%S");


v_1 <- as.numeric(as.character(df$Global_active_power));

v_2 <- as.numeric(as.character(df$Voltage));

v_3_1 <- as.numeric(as.character(df$Sub_metering_1));
v_3_2 <- as.numeric(as.character(df$Sub_metering_2));
v_3_3 <- as.numeric(as.character(df$Sub_metering_3));

v_4 <- as.numeric(as.character(df$Global_reactive_power));



par(mfrow = c(2, 2));

plot(t, v_1, type="l", ylab="Global Active Power (kilowatts)", xlab="");
plot(t, v_2, type="l", ylab="Voltage", xlab="datetime");

with(df,  plot(t, v_3_1, type="l", col="black", ylab="Energy sub metering", xlab=""));
with(df, lines(t, v_3_2, type="l", col="red"));
with(df, lines(t, v_3_3, type="l", col="blue"));
legend("topright",lty=1, col=c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"));

plot(t, v_4, type="l", ylab="Global_reactive_power", xlab="datetime");

dev.copy(png, "plot4.png");
dev.off();
