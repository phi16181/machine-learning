#Import Data
household_orig <- read.csv("~/ML Toolbox/R Scripts/timeSeries/household_power_consumption.txt", sep=";", stringsAsFactors=FALSE)
View(household_orig)

#Make working copy of data
household<-household_orig
summary(household)

#original
household_orig

#woking copy
household

#convert datatypes (where applicable, chrs to factors first to prevent NA coercion)
household$Global_active_power<-as.factor(household$Global_active_power)
household$Global_active_power<-as.numeric(household$Global_active_power)

#convert on the fly examples
household$Global_reactive_power<-as.numeric(as.factor(household$Global_reactive_power))
household$Voltage<-as.numeric(as.factor(household$Voltage))
household$Global_intensity<-as.numeric(as.factor(household$Global_intensity))
household$Sub_metering_1<-as.numeric(as.factor(household$Sub_metering_1))
household$Sub_metering_2<-as.numeric(as.factor(household$Sub_metering_2))
household$Sub_metering_3<-as.numeric(as.factor(household$Sub_metering_3))

# Combine Date and Time attribute values in a new attribute column
household <-cbind(household,paste(household$Date,household$Time), stringsAsFactors=FALSE)

#rename col #11
colnames(household)[11] <-"DateTime"

#Move new col to front
household <- household[,c(ncol(household), 1:(ncol(household)-1))]
View(household)

#change to Date datatype
household_60$Date<-strptime(as.character(household_60$Date), "%d/%m/%Y")
#reformat date with Lubridate (change to Y/M/D)
household$Date<-parse_date_time(household$Date,"dmy")

#Extract Year
household$Year<- year(household$Date)

#fix sampling - create four different options
#15 mins freq
household_15<- household[seq(1,nrow(household), 15),]
#30 mins
household_30<- household[seq(1,nrow(household), 30),]
#45 mins
household_45<- household[seq(1,nrow(household), 45),]
#hourly
household_60<- household[seq(1,nrow(household), 60),]

#subset each year by date
yr_2006_60<- household_60[household_60$Date >= "2006-12-16" & household_60$Date <= "2006-12-31",]




yr_2007_60<- household_60[household_60$Date >= "2007-01-01" & household_60$Date <= "2007-12-31",]



yr_2008_60<- household_60[household_60$Date >= "2008-01-01" & household_60$Date <= "2008-12-31",]
yr_2009_60<- household_60[household_60$Date >= "2009-01-01" & household_60$Date <= "2009-12-31",]
yr_2010_60<- household_60[household_60$Date >= "2010-01-01" & household_60$Date <= "2010-11-26",]

#Jan2008
Jan2008_60<-household_60[household_60$Date >= "2008-01-01" & household_60$Date <= "2008-01-31",]

#time series
Jan2008_60_ts<-ts(Jan2008_60)
Jan2008_60_ts

#dumVars
householdDumVar$DumVar<- 1:nrow(householdDumVar)

