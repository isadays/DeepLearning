#Packages
packages <-c("rattle","rnn","ggplot2","dplyr")

if(sum(as.numeric(!packages %in% installed.packages())) != 0){
  install_pack <- packages[!packages %in% installed.packages()]
  for(i in 1:length(install_pack)) {
    install.packages(install_pack, dependencies = T)
    break()}
  sapply(packages, require, character = T) 
} else {
  sapply(packages, require, character = T) 
}

library("rattle")
library("rnn")

#dataset: weatherAUS.csv

data("weatherAUS")

#Rows: 1-3040 and only one column
data <- weatherAUS[1:3040,14:15]
summary(data)

#Pre-processing
data_cleaned <- na.omit(data)
data_used=data_cleaned[1:3000,]
x=data_used[,1]
y=data_used[,2]

Yscaled = (y - min(y)) / (max(y) - min(y))
Xscaled = (x - min(x)) / (max(x) - min(x))

y <- Yscaled
x <- Xscaled

x <- as.matrix(x)
y <- as.matrix(y)

X <- matrix(x, nrow = 30)
Y <- matrix(y, nrow = 30)
#train test split
train=1:80
test=81:100

#model  type of network, could be rnn, gru or lstm. gru and lstm are experimentale.

set.seed(12)
model <- trainr(Y = Y[,train],
                X = X[,train],
                learningrate = 0.01,
                hidden_dim = 15,
                network_type = "rnn",
                numepochs = 100)


plot(colMeans(model$error),type="l",xlab="Epochs", ylab="Errors")

plot(colMeans(model$last_layer_delta),type="l",xlab="Epochs", ylab="Last Layer delta")

#predicting 

Yp <-predictr(model,X[,test])
rsq <- function(y_actual,y_predict){
  cor(y_actual,y_predict)^2
}

Ytest <- t(matrix(Y[,test], nrow=1))
Ypredicted <- t(matrix(Yp,nrow=1))

result_data <- data.frame(Ytest)
result_data$Ypredicted <- Ypredicted
rsq(result_data$Ytest, result_data$Ypredicted)


mean(result_data$Ytest)
mean(result_data$Ypredicted)


plot(as.vector(t(result_data$Ytest)), col = 'red', type='l',
     main = "Actual vs Predicted Humidity: testing set",
     ylab = "Y,Yp")
lines(as.vector(t(Yp)), type = 'l', col = 'black')
legend("bottomright", c("Predicted", "Actual"),
       col = c("red","black"),
       lty = c(1,1), lwd = c(1,1))
