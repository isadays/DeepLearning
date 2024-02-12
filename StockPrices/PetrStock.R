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

library("dplyr")
library("rnn")

data <- read.csv("PETR4.SA.csv")


data <-data[order(data$Date,decreasing = TRUE),]

close <- data$Close

prev_close <-lead(close,n=1L)

data_analysis <- data.frame(close)
data_analysis$prev_close <- prev_close
summary(data_analysis)



#dropp na 

data_analysis <- data_analysis[1:248,]

x <- data_analysis[,2]
y <- data_analysis[,1]

X <- matrix(x,nrow = 31)
Y <- matrix(y,nrow =31)



Yscaled <- (Y - min(Y)) / (max(Y) - min(Y))
Xscaled <- (X - min(X)) / (max(X) - min(X))
Y <- Yscaled
X <- Xscaled


train=1:6
test=7:8

set.seed(12)
model <- trainr(Y = Y[,train],
                X = X[,train],
                learningrate = 0.05,
                hidden_dim = 20,
                numepochs = 1000,
                network_type = "rnn"
)


Ytrain <- t(matrix(predictr(model, X[,train]),nrow=1))
Yreal <- t(matrix(Y[,train],nrow=1))


rsq <- function(y_actual,y_predict){
  cor(y_actual,y_predict)^2
}

rsq(Yreal,Ytrain)


plot(Ytrain, type = "l", col = "darkred")
lines(Yreal, col = "darkblue", type = "l")


#Test set

Ytest = t(matrix(Y[,test],nrow = 1))


Yp <- predictr(model, X[,test])
Ypredicted=matrix(Yp, nrow = 1)
Ypredicted=t(Ypredicted)

result_data <- data.frame(Ytest)
result_data$Ypredicted <- Ypredicted     

rsq(result_data$Ytest,result_data$Ypredicted)

mean(result_data$Ytest)
mean(result_data$Ypredicted)


plot(Ypredicted, type = "l", col = "darkred")
lines(Yreal, col = "darkblue", type = "l")
