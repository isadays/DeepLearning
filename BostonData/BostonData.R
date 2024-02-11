#Packages
packages <- c("MASS","neuralnet","ISLR","mlbench","neuralnet","rpart")


if(sum(as.numeric(!packages %in% installed.packages())) != 0){
  install_pack <- packages[!packages %in% installed.packages()]
  for(i in 1:length(install_pack)) {
    install.packages(install_pack, dependencies = T)
    break()}
  sapply(packages, require, character = T) 
} else {
  sapply(packages, require, character = T) 
}

#################################################
library("MASS")
library("rpart")

set.seed(0)
data <- Boston

#is nan
data[is.na(data) == TRUE]

train_test_split_index <- 0.8 * nrow(data)

train <- data.frame(data[1:train_test_split_index,])
test <- data.frame(data[(train_test_split_index+1): nrow(data),])


# recursive partioning and regression trees 
#anova method
fit_tree <- rpart(medv ~.,method="anova",data=train )
tree_predict <- predict(fit_tree,test)
#mean square
mse_tree <- mean((tree_predict - test$medv)^2) 


max_data <- apply(data,2,max)

min_data <- apply(data,2,min)

scaled <- scale(data,center=min_data,scale = max_data - min_data)

index = sample(1:nrow(data),round(0.70*nrow(data)))
train_data <- as.data.frame(scaled[index,])
test_data <- as.data.frame(scaled[-index,])
#Training of neural networks
library(neuralnet)


#different architectures
nn <- neuralnet(medv ~ crim+zn+indus+chas+nox+rm+age+dis+rad+tax+ptratio+black+lstat,
                data=train_data,
                hidden = c(5,4,3,2),
                linear.output = T)
plot(nn)
#all rows - 1 to 13 columns
pr.nn <- compute(nn,test_data[,1:13])
pr.nn_ <- pr.nn$net.result*(max(data$medv)-min(data$medv)+min(data$medv))

test.r <- (test_data$medv)*(max(data$medv)-min(data$medv)+min(data$medv))

MSE_nn <- mean((pr.nn_-test.r)^2)


#Plot the result
plot(test_data$medv,type = 'l',col="red",xlab = "x", ylab = "Residence Price")
lines(pr.nn$net.result,col = "blue") #predicted


