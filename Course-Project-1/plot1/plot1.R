dir<- "C:/Users/shankar/Desktop/Exploratory_Data_Analysis/Data"
setwd(dir)
getwd()
dataaddress<- './UCI_ElectPowerConsumption/exdata_data_household_power_consumption/household_power_consumption.txt'
epc <- read.table (dataaddress, header=TRUE, sep = ';')
# subset data for the two specific dates
epc1 <- epc[epc$Date == '1/2/2007',]
epc2 <- epc[epc$Date == '2/2/2007',]
epct <- rbind(epc1, epc2)
# extract the parameter to plot
epctpower<- epct$Global_active_power
f<- epctpower
# unfactor f
g<-  as.numeric(levels(f)[as.integer(f)])
# plot histogram
hist(g, col="red", breaks= c(0.5*0:15), main="Global Active Power", xlab = "Global Active Power (kilowatts)") 
# copy to png file with 480 x 480 size
dev.copy(png, file="plot1.png", height = 480, width = 480)
# turn off device
dev.off()
 