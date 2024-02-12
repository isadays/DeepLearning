#Packages
packages <-c("devtools","ggplot2","dplyr")

if(sum(as.numeric(!packages %in% installed.packages())) != 0){
  install_pack <- packages[!packages %in% installed.packages()]
  for(i in 1:length(install_pack)) {
    install.packages(install_pack, dependencies = T)
    break()}
  sapply(packages, require, character = T) 
} else {
  sapply(packages, require, character = T) 
}


library(dplyr)
library(RBM)


set.seed(0)

data(Fashion)


#'The labels are as follows: 
#'0: T-shirt/tops 
#'1: Trouser 
#'2: Pullover 
#'3: Dress 
#'4: Coat 
#'5: Sandal 
#'6: Shirt 
#'7: Sneaker 
#'8: Bag 
#'9: Ankle Boot 


image(matrix(Fashion$trainX[,102], nrow = 28))

Fashion$trainY[102]
Fashion$trainY[102]


Fashion$trainX <- Fashion$trainX[,1:2000]
Fashion$trainY <- Fashion$trainY[1:2000]
Fashion$testX <- Fashion$testX[,1:200]
Fashion$testY <- Fashion$testY[1:200]


train <- t(Fashion$trainX)


modelRBM <- RBM(x = train, n.iter = 1000, n.hidden = 100, size.minibatch = 10, plot = TRUE)

test <- t(Fashion$testX)
ReconstructRBM(test = test[102,], model = modelRBM)
