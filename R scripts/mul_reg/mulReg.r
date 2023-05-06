library(readr)
existing <- read_csv("existingproductattributes2017.csv",
col_types = cols(ProductNum = col_skip()))
View(existing)
existing$ProductType<-as.factor(existing$ProductType)
str(existing)
summary(existing)

#load caret
library(caret)
newDataframe1 <- dummyVars(" ~ .", data = existingProd)
readyData1 <- data.frame(predict(newDataframe1, newdata = existingProd))
View(readyData)
set.seed(123)

#train/test
trainSize<-round(nrow(readyData)*0.7)
training_indices<-sample(seq_len(nrow(readyData)),size =trainSize)
trainSet<-readyData[training_indices,]
testSet<-readyData[-training_indices,]

#lm
lmFit1<-lm(Volume~. , trainSet)
lmFit1
summary(lmFit1)
#list model objects (you can get any info you want from these by typing the name of the model and the name of the object (model$object))
str(lmFit1) 
#plot model objects
plot(lmFit1)
#error of the model
lmerror <- lmFit1$residuals
#RMSE
lm_error <- sqrt(mean(lmerror^2))
#show the error
lm_error

#svm
install.packages('e1071')
library(e1071)
svmFit1<-svm(Volume~., trainSet)
#model parameters
svmFit1
#model residuals
svmFit1$residuals
#error
svmerror <- svmFit1$residuals
#RMSE
svm_error <- sqrt(mean(svmerror^2))
#show the error
svm_error


#randomForest
install.packages('randomForest')
library(randomForest)
rfFit1<-randomForest(Volume~., trainSet)
#model parameters % var explained is R2)
rfFit1




Filtering - correlation coefficients
Embeded - algos feature sel for you - stepwise lin reg - leapseq
Wrapper - function in caret with rfe
jason brownlee











