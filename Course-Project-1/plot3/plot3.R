dir<- "C:/Users/shankar/Desktop/Exploratory_Data_Analysis/Data"
setwd(dir)
getwd()
dataaddress<- './UCI_ElectPowerConsumption/exdata_data_household_power_consumption/household_power_consumption.txt'
# ensure that columns are not interpreted as factors
options(stringsAsFactors = FALSE)
epc <- read.table (dataaddress, header=TRUE, sep = ';')
# subset data for the two specific dates
epc1 <- epc[epc$Date == '1/2/2007',]
epc2 <- epc[epc$Date == '2/2/2007',]
epct <- rbind(epc1, epc2)
# extract the parameter to plot
#epctpower<- epct$Global_active_power
#f<- epctpower
# unfactor f
#global.active.power<-as.numeric(levels(f)[as.integer(f)])
library(lubridate)
#convert Date and Time string to date and time in POSIXCt
date <- dmy(epct$Date)
time <- hms(epct$Time)
#Find the day labels
day.1 <- wday(date[1],label=TRUE) # Thurs - as per R package
day.2<- wday(date[length(date)], label = TRUE) #Fri
# determine the day afer the period of interest, for labeling reasons
ndate <- date[length(date)]+ days(1)
day.3<- wday(ndate, label=TRUE) #Sat
#unfactor and convert the three days to strings
d1<- droplevels(day.1)
d1<- as.character(d1)# This gives 'Thurs' - so not used
# Professor hardcoded the three labels - and hence 'Thu' for 'Thurs'
# this process can be repeated for day.2 and day.3 to get other days
# Then d1,d2, and d3 would be used in place of the hardcoding below
# axis(1, at= c(0,1400,2799), labels=c(d1, d2, d3)) would be used below
# This has been verified to work; however, hard coded to be compatible

#calculate relative time difference
rdate <- date - date[1]
#add date and time info to find the span
tot.time <- as.period(time)+ as.period(rdate)
# convert Global_active_power from character to numeric
#gl.act.pwr <- as.numeric(epct$Global_active_power)
#convert tot.time to minutes
tot.time.min <- 60*24*day(tot.time)+ 60*hour(tot.time)+ minute(tot.time)
# plot (tot.time.min, gl.act.pwr)
# plot first with axes and annotation set at FALSE
sub.mtr.1<- as.numeric(epct$Sub_metering_1)
sub.mtr.2<- as.numeric(epct$Sub_metering_2)
sub.mtr.3<- as.numeric(epct$Sub_metering_3)

plot (tot.time.min, sub.mtr.1, axes=FALSE, ann=FALSE, type="s", col="purple")
lines (tot.time.min, sub.mtr.2, axes=FALSE, ann=FALSE, type="s", col="red")
lines (tot.time.min, sub.mtr.3,axes=FALSE, ann=FALSE, type="s", col="blue")
#plot (tot.time.min, gl.act.pwr, ylab= "Global Active Power (Kilowatts)", xlab="", axes=FALSE, ann=FALSE, type="l")
#set up y axis
axis(2, at = seq(0,30,10))
mtext("Energy sub metering", side=2,line =3)
#set up x axis
axis(1, at= c(0,1400,2880), labels=c("Thu", "Fri", "Sat")) 
bx<- xy.coords(x=c(1800,3000), y=c(40,30))
legend (bx, c("sub_metering_1", "sub_metering_2", "sub_metering_3"), lty = c(1,1,1), col= c("purple","red","blue"), cex=0.8)
#legend (x=1800, y= 40, c("sub_metering_1", "sub_metering_2", "sub_metering_3"), lty = c(1,1,1), col= c("purple","red","blue"), cex=0.8)
#legend ("topright", inset = .02, c("sub_metering_1", "sub_metering_2", "sub_metering_3"), lty = c(1,1,1), col= c("purple","red","blue"), cex = 0.50)
box()
# copy to png file with 480 x 480 size
dev.copy(png, file="plot3.png", height = 480, width = 480)
# turn off device
dev.off()
 