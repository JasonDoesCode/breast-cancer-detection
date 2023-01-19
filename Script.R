library(leaps)
library(boot)
library(caret)
library(caTools)
library(splines)
library(gam)

#read in the dataset by using read.csv()
MyData <- read.csv("Breast Cancer Prediction_Clean.csv", header=T)

#Convert Outcome variable to Categorical
MyData$Class <- as.factor(MyData$Class)

#set seed
set.seed(5)

#Forward Selection
regfit.fwd = regsubsets(Class~.,data=MyData,nvmax=9,method="forward")
summary(regfit.fwd)

Error.rates=rep(0,9)

#1 Variable Model
glm.fit=glm(Class~Bare.Nuclei,data=MyData,family=binomial)
error.rate=cv.glm(MyData,glm.fit,K=5)$delta[1]
Error.rates[1]=error.rate

#2 Variable Model
glm.fit=glm(Class~Bare.Nuclei+Uniformity.of.Cell.Size,data=MyData,family=binomial)
error.rate=cv.glm(MyData,glm.fit,K=5)$delta[1]
Error.rates[2]=error.rate

#3 Variable Model
glm.fit=glm(Class~Bare.Nuclei+Uniformity.of.Cell.Size+Clump.Thickness,data=MyData,family=binomial)
error.rate=cv.glm(MyData,glm.fit,K=5)$delta[1]
Error.rates[3]=error.rate

#4 Variable Model
glm.fit=glm(Class~Bare.Nuclei+Uniformity.of.Cell.Size+Clump.Thickness+Normal.Nucleoli,data=MyData,family=binomial)
error.rate=cv.glm(MyData,glm.fit,K=5)$delta[1]
Error.rates[4]=error.rate

#5 Variable Model
glm.fit=glm(Class~Bare.Nuclei+Uniformity.of.Cell.Size+Clump.Thickness+Normal.Nucleoli+Bland.Chromatin,data=MyData,family=binomial)
error.rate=cv.glm(MyData,glm.fit,K=5)$delta[1]
Error.rates[5]=error.rate

#6 Variable Model
glm.fit=glm(Class~Clump.Thickness+Uniformity.of.Cell.Size+Uniformity.of.Cell.Shape+Bare.Nuclei+Bland.Chromatin+Normal.Nucleoli,data=MyData,family=binomial)
error.rate=cv.glm(MyData,glm.fit,K=5)$delta[1]
Error.rates[6]=error.rate

#7 Variable Model
glm.fit=glm(Class~Clump.Thickness+Uniformity.of.Cell.Size+Uniformity.of.Cell.Shape+Bare.Nuclei+Bland.Chromatin+Normal.Nucleoli+Marginal.Adhesion,data=MyData,family=binomial)
error.rate=cv.glm(MyData,glm.fit,K=5)$delta[1]
Error.rates[7]=error.rate

#8 Variable Model
glm.fit=glm(Class~Clump.Thickness+Uniformity.of.Cell.Size+Uniformity.of.Cell.Shape+Bare.Nuclei+Bland.Chromatin+Normal.Nucleoli+Marginal.Adhesion+Single.Epithelial.Cell.Size,data=MyData,family=binomial)
error.rate=cv.glm(MyData,glm.fit,K=5)$delta[1]
Error.rates[8]=error.rate

#9 Variable Model
glm.fit=glm(Class~.,data=MyData,family=binomial)
error.rate=cv.glm(MyData,glm.fit,K=5)$delta[1]
Error.rates[9]=error.rate

#Plot the Error Rates over each model
plot(Error.rates, type = "o", col = "blue", xlab ="Number of Predictors", ylab ="K-Cross-Validation Error", main="Forward Selection")

#Numerical output of Error Rates from Forward Selection
Error.rates

#Backward Selection  
regfit.bwd = regsubsets(Class~.,data=MyData,nvmax=9,method="backward")
summary(regfit.bwd)

Error.rates2=rep(0,9)

#1 Variable Model
glm.fit=glm(Class~Bare.Nuclei,data=MyData,family=binomial)
error.rate=cv.glm(MyData,glm.fit,K=5)$delta[1]
Error.rates2[1]=error.rate

#2 Variable Model
glm.fit=glm(Class~Bare.Nuclei+Uniformity.of.Cell.Size,data=MyData,family=binomial)
error.rate=cv.glm(MyData,glm.fit,K=5)$delta[1]
Error.rates2[2]=error.rate

#3 Variable Model
glm.fit=glm(Class~Bare.Nuclei+Uniformity.of.Cell.Size+Clump.Thickness,data=MyData,family=binomial)
error.rate=cv.glm(MyData,glm.fit,K=5)$delta[1]
Error.rates2[3]=error.rate

#4 Variable Model
glm.fit=glm(Class~Bare.Nuclei+Uniformity.of.Cell.Size+Clump.Thickness+Normal.Nucleoli,data=MyData,family=binomial)
error.rate=cv.glm(MyData,glm.fit,K=5)$delta[1]
Error.rates2[4]=error.rate

#5 Variable Model
glm.fit=glm(Class~Bare.Nuclei+Uniformity.of.Cell.Size+Clump.Thickness+Normal.Nucleoli+Bland.Chromatin,data=MyData,family=binomial)
error.rate=cv.glm(MyData,glm.fit,K=5)$delta[1]
Error.rates2[5]=error.rate

#6 Variable Model
glm.fit=glm(Class~Clump.Thickness+Uniformity.of.Cell.Size+Uniformity.of.Cell.Shape+Bare.Nuclei+Bland.Chromatin+Normal.Nucleoli,data=MyData,family=binomial)
error.rate=cv.glm(MyData,glm.fit,K=5)$delta[1]
Error.rates2[6]=error.rate

#7 Variable Model
glm.fit=glm(Class~Clump.Thickness+Uniformity.of.Cell.Size+Uniformity.of.Cell.Shape+Bare.Nuclei+Bland.Chromatin+Normal.Nucleoli+Marginal.Adhesion,data=MyData,family=binomial)
error.rate=cv.glm(MyData,glm.fit,K=5)$delta[1]
Error.rates2[7]=error.rate

#8 Variable Model
glm.fit=glm(Class~Clump.Thickness+Uniformity.of.Cell.Size+Uniformity.of.Cell.Shape+Bare.Nuclei+Bland.Chromatin+Normal.Nucleoli+Marginal.Adhesion+Single.Epithelial.Cell.Size,data=MyData,family=binomial)
error.rate=cv.glm(MyData,glm.fit,K=5)$delta[1]
Error.rates2[8]=error.rate

#9 Variable Model
glm.fit=glm(Class~.,data=MyData,family=binomial)
error.rate=cv.glm(MyData,glm.fit,K=5) $delta[1]
Error.rates2[9]=error.rate

#Plot the Error Rates over each model
plot(Error.rates2, type = "o", col = "red", xlab ="Number of Predictors", ylab ="K-Cross-Validation Error", main="Backward Selection")

#Numerical output of Error Rates from Backward Selection
Error.rates2

plot(Error.rates2, type = "o", col = "red", xlab ="Number of Predictors", ylab ="K-Cross-Validation Error", main="Forward vs Backward Selection")
lines(Error.rates, type = "o", col = "blue")
legend("topright",legend=c("Forward Selection", "Backward Selection"), col=c("blue","red"), lty = 1:1)


#Ridge Regression
fitController = trainControl(method = "cv", number = 5, savePredictions = T)

RidgeReg.model = train(Class~., data=MyData, method = "glmnet", trControl = fitController,
                       tuneGrid=expand.grid(.alpha=0,.lambda=10^seq(-10,10, length=100)), family = "binomial")

#Lambda value that corresponds to the highest accuracy
RidgeReg.model$bestTune

#confusion matrix of the model
sub.ridge=subset(RidgeReg.model$pred,RidgeReg.model$pred$lambda==RidgeReg.model$bestTune$lambda)

confMatrix = table(sub.ridge$pred,sub.ridge$obs)
Ridge.Acc = (confMatrix[[1,1]] + confMatrix[[2,2]]) / sum(confMatrix)
Ridge.Error = 1 - Ridge.Acc

#The coefficient estimates from Ridge Regression from the optimal model
coef(RidgeReg.model$finalModel, RidgeReg.model$bestTune$lambda)


#Lasso
fitController = trainControl(method = "cv", number = 5, savePredictions = T)

Lasso.model = train(Class~., data=MyData, method = "glmnet", trControl = fitController,
                       tuneGrid=expand.grid(.alpha=1,.lambda=10^seq(-10,10, length=100)), family = "binomial")

#Lambda value that corresponds to the highest accuracy
Lasso.model$bestTune

#confusion matrix of the model
sub.ridge=subset(Lasso.model$pred,Lasso.model$pred$lambda==Lasso.model$bestTune$lambda)

confMatrix = table(sub.ridge$pred,sub.ridge$obs)
Lasso.Acc = (confMatrix[[1,1]] + confMatrix[[2,2]]) / sum(confMatrix)
Lasso.Error = 1 - Lasso.Acc

#The coefficient estimates from Lasso from the optimal model
coef(Lasso.model$finalModel, Lasso.model$bestTune$lambda)



#Generalized Additive Models 
split = sample.split(MyData$Class, SplitRatio = 0.7)
train = subset(MyData, split == TRUE)
test = subset(MyData, split == FALSE)

#Benchmark 4 Variable Model
glm.fit=glm(Class~Bare.Nuclei+Uniformity.of.Cell.Size+Clump.Thickness+Normal.Nucleoli,data=train,family=binomial)

glm.probs = predict(glm.fit,test,type="response")

glm.pred = rep("Benign",205) #There are 205 observations in the Test Subset
glm.pred[glm.probs>0.5] = "Malignant"

#confusion matrix for the model
confmatrix <- table(glm.pred,test$Class)

#Accuracy
accuracy = (confmatrix[[1,1]] + confmatrix[[2,2]]) / sum(confmatrix)

#Misclassification Error Rate
ErrorRate = 1 - accuracy

#GAM 4 Variable Model
gam.lr=gam(Class~s(Bare.Nuclei,df=3)+s(Uniformity.of.Cell.Size,df=3)+s(Clump.Thickness,df=3)+s(Normal.Nucleoli,df=3), family=binomial, data=train)

gam.probs = predict(gam.lr,test,type="response")

gam.pred = rep("Benign",205) #There are 205 observations in the Test Subset
gam.pred[gam.probs>0.5] = "Malignant"

#confusion matrix for the model
confmatrix = table(gam.pred,test$Class)

#Accuracy
accuracy = (confmatrix[[1,1]] + confmatrix[[2,2]]) / sum(confmatrix)

#Misclassification Error Rate
ErrorRate = 1 - accuracy

par(mfrow=c(1,4))
plot(gam.lr,se=T,col="red")

#GAM 4 Variable Model 2
gam.lr=gam(Class~Bare.Nuclei+Uniformity.of.Cell.Size+Clump.Thickness+s(Normal.Nucleoli,df=5), family=binomial, data=train)

gam.probs = predict(gam.lr,test,type="response")

gam.pred = rep("Benign",205) #There are 205 observations in the Test Subset
gam.pred[gam.probs>0.5] = "Malignant"

#confusion matrix for the model
confmatrix = table(gam.pred,test$Class)

#Accuracy
accuracy = (confmatrix[[1,1]] + confmatrix[[2,2]]) / sum(confmatrix)

#Misclassification Error Rate
ErrorRate = 1 - accuracy

par(mfrow=c(1,4))
plot(gam.lr,se=T,col="red")

#Benchmark 9 Variable Model
glm.fit=glm(Class~.,data=train,family=binomial)

glm.probs = predict(glm.fit,test,type="response")

glm.pred = rep("Benign",205) #There are 205 observations in the Test Subset
glm.pred[glm.probs>0.5] = "Malignant"

#confusion matrix for the model
confmatrix <- table(glm.pred,test$Class)

#Accuracy
accuracy = (confmatrix[[1,1]] + confmatrix[[2,2]]) / sum(confmatrix)

#Misclassification Error Rate
ErrorRate = 1 - accuracy

#GAM 9 Variable Model
gam.lr=gam(Class~s(Bare.Nuclei,df=3)+s(Uniformity.of.Cell.Size,df=3)+s(Clump.Thickness,df=3)+s(Normal.Nucleoli,df=3)+
             s(Uniformity.of.Cell.Shape,df=3)+s(Marginal.Adhesion,df=3)+s(Single.Epithelial.Cell.Size,df=3)+
             s(Bland.Chromatin,df=3)+s(Mitoses,df=3), family=binomial, data=train)

gam.probs = predict(gam.lr,test,type="response")

gam.pred = rep("Benign",205) #There are 205 observations in the Test Subset
gam.pred[gam.probs>0.5] = "Malignant"

#confusion matrix for the model
confmatrix = table(gam.pred,test$Class)

#Accuracy
accuracy = (confmatrix[[1,1]] + confmatrix[[2,2]]) / sum(confmatrix)

#Misclassification Error Rate
ErrorRate = 1 - accuracy

par(mfrow=c(1,4))
plot(gam.lr,se=T,col="red")

#GAM 9 Variable Model 2
gam.lr=gam(Class~Bare.Nuclei+s(Uniformity.of.Cell.Size,df=5)+Clump.Thickness+s(Normal.Nucleoli,df=5)+
             Uniformity.of.Cell.Shape+s(Marginal.Adhesion,df=5)+s(Single.Epithelial.Cell.Size,df=5)+
             Bland.Chromatin+Mitoses, family=binomial, data=train)

gam.probs = predict(gam.lr,test,type="response")

gam.pred = rep("Benign",205) #There are 205 observations in the Test Subset
gam.pred[gam.probs>0.5] = "Malignant"

#confusion matrix for the model
confmatrix = table(gam.pred,test$Class)

#Accuracy
accuracy = (confmatrix[[1,1]] + confmatrix[[2,2]]) / sum(confmatrix)

#Misclassification Error Rate
ErrorRate = 1 - accuracy

par(mfrow=c(1,4))
plot(gam.lr,se=T,col="red")