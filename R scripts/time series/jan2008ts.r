View(Jan2008_60)
#Frequency = 31 days * 24 hours
tsJan2008<-ts(tsJan2008, frequency = (31*24))
tsJan2008_comp<-decompose(tsJan2008)
tsJan2008_adj<-tsJan2008 - tsJan2008_comp$seasonal
autoplot(tsJan2008_adj)
tsJan2008_hw<-HoltWinters(tsJan2008_adj)
plot(tsJan2008_hw)
#make forecast (125 periods)
tsJan2008_forecast<- forecast(tsJan2008_hw, h=125, beta =FALSE, gamma=FALSE)
plot(tsJan2008_forecast, ylim = c(0,20), ylab = 'Watt-Hours', xlab = 'Time')
plot(tsJan2008_forecast, ylim = c(0,20), xlim = 10,20, ylab = 'Watt-Hours', xlab = 'Time')
plot(tsJan2008_forecast, ylim = c(0,20), xlim = c(0,20), ylab = 'Watt-Hours', xlab = 'Time')
plot(tsJan2008_forecast, ylim = c(0,20), xlim = c(11,20), ylab = 'Watt-Hours', xlab = 'Time')
plot(tsJan2008_forecast, ylim = c(0,20), xlim = c(11,14), ylab = 'Watt-Hours', xlab = 'Time')
plot(tsJan2008_forecast, ylim = c(0,20), xlim = c(12,13), ylab = 'Watt-Hours', xlab = 'Time')
plot(tsJan2008_forecast, ylim = c(0,20), xlim = c(12.6,13), ylab = 'Watt-Hours', xlab = 'Time')
tsJan2008_forecast<- forecast(tsJan2008_hw, h=125)
plot(tsJan2008_forecast, ylim = c(0,20), xlim = c(12.6,13), ylab = 'Watt-Hours', xlab = 'Time')
plot(tsJan2008_forecast, xlim = c(12.6,13), ylab = 'Watt-Hours', xlab = 'Time')
plot(tsJan2008_forecast, ylim=c(0,40), xlim = c(12.6,13), ylab = 'Watt-Hours', xlab = 'Time')
plot(tsJan2008_forecast, ylim=c(0,36), xlim = c(12.6,13), ylab = 'Watt-Hours', xlab = 'Time')
plot(tsJan2008_forecast, ylim=c(0,38), xlim = c(12.6,13), ylab = 'Watt-Hours', xlab = 'Time')
plot(tsJan2008_forecast, ylim=c(0,38), xlim = c(12.6,12.95), ylab = 'Watt-Hours', xlab = 'Time')
#Best Plot
plot(tsJan2008_forecast, ylim=c(0,38), xlim = c(12.75,13), ylab = 'Watt-Hours', xlab = 'Time')

#Frequency = 31 days EXPERIMENTAL
exp_Jan2008_60<-Jan2008_60
#exp_Jan2008_60$Date<-NULL
#exp_Jan2008_60$Time<-NULL
exp_tsJan2008<-ts(exp_Jan2008_60, frequency = 31, start=c(2008,1), end=c(2008,31))
summary(tsJan2008)
summary(Jan2008_60)
autoplot(exp_tsJan2008)


exp_tsJan2008_comp<-decompose(exp_tsJan2008)
plot(exp_tsJan2008_comp$seasonal)
exp_tsJan2008_adj<-exp_tsJan2008 - exp_tsJan2008_comp$seasonal
autoplot(exp_tsJan2008_adj)
exp_tsJan2008_hw<-HoltWinters(exp_tsJan2008_adj)
plot(exp_tsJan2008_hw)
#make forecast (125 periods)
exp_tsJan2008_forecast<- forecast(exp_tsJan2008_hw, h=12, beta=FALSE, gamma=FALSE)
plot(tsJan2008_forecast, ylab = 'Watt-Hours', xlab = 'Time')
ggplot(tsJan2008, aes(tsJan2008$Date,tsJan2008$Sub_Metering_2))


##Trial2##This works
View(Jan2008_60)
str(Jan2008_60)
summary(Jan2008_60)
Jan2008_60$Date<-NULL
Jan2008_60$Time<-NULL
#Frequency = 31 days * 24 hours
tsJan2008_60<-ts(Jan2008_60$Sub_metering_2, frequency = 31)
plot(tsJan2008_60)
tsJan2008_comp<-decompose(tsJan2008_60)
#tsJan2008_adj<-tsJan2008 - tsJan2008_comp$seasonal
autoplot(tsJan2008_comp)
tsJan2008_hw<-HoltWinters(tsJan2008_60)
plot(tsJan2008_hw)
#make forecast (125 periods)
tsJan2008_forecast<- forecast(tsJan2008_hw, h=48, beta =FALSE, gamma=FALSE)
plot(tsJan2008_forecast, ylim = c(0,20), ylab = 'Watt-Hours', xlab = 'Time')
#Best Plot
plot(tsJan2008_forecast, ylim=c(0,38), xlim = c(23,26), ylab = 'Watt-Hours', xlab = 'Time')



#One month of data sample every hour
View(Jan2008_60)
str(Jan2008_60)
summary(Jan2008_60)
#remove date and time
Jan2008_60$Date<-NULL
Jan2008_60$Time<-NULL
#Frequency = 31 days * 24 hours
tsJan2008_60<-ts(Jan2008_60$Sub_metering_2, frequency = 31)
plot(tsJan2008_60) #This shows one time period (frequency / Observations)
#tsJan2008_comp<-decompose(tsJan2008_60)
#tsJan2008_adj<-tsJan2008 - tsJan2008_comp$seasonal
autoplot(tsJan2008_comp)
#Exponental Smoothing
tsJan2008_hw<-HoltWinters(tsJan2008_60)
plot(tsJan2008_hw)
#make forecast (1 day (24 hours) periods)
tsJan2008_forecast<- forecast(tsJan2008_hw, h=24)
plot(tsJan2008_forecast, ylim = c(0,20), ylab = 'Watt-Hours', xlab = 'Time')
#Best Plot
plot(tsJan2008_forecast, ylim=c(0,38), xlim = c(24,25), ylab = 'Watt-Hours', xlab = 'Time')
