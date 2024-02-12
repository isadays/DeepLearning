# The MNIST (Modified National Institute of Standards and Technology database) dataset contains 
# a training set of 60,000 images and a test set of 10,000 images of handwritten digits. 
# The handwritten digit images have been size-normalized 
# and centered in a fixed size of 28×28 pixels. The MNIST digits dataset is often 
# used by data scientists who want to try machine learning technique
# s and pattern recognition methods on real-world data while spending minimal 
# effort on preprocessing and formatting.

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

#Restricted Boltzmannn machine 

library("devtools")

#install_github("TimoMatzen/RBM")
library("RBM")

data("MNIST")

image(matrix(MNIST$trainX[2,],nrow=28))

MNIST$trainY[2]
#train the model to 
set.seed(0)

train <- MNIST$trainX
modelRBM <- RBM(x = train, n.iter = 1000, n.hidden=100, size.minibatch = 10, plot=TRUE)


#Image reconstruction

set.seed(0)
test <- MNIST$testX
testY <- MNIST$testY

test[100,]
testY[5]

ReconstructRBM(test=test[5,],model = modelRBM)


# Stack RBM -Stacked Restricted Boltzmann Machine 

train <- MNIST$trainX
test <-MNIST$testX

modStack <- StackRBM(x=train, layers = c(100,100,100), n.iter=1000,size.minibatch = 10)
ReconstructRBM(test = test[5,], model=modStack, layers=3)
