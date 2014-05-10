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
hist(v, col="red", main="Global Active Power", xlab ="Global Active Power (kilowatts)");

dev.copy(png, "plot1.png");
dev.off();

