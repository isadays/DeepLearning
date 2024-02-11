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

library(neuralnet)
library(ISLR)
data <- College


#treating the variable private - categorical variable
private <- ifelse(data$Private=='Yes',1,0)

data <- data[,2:18]

max_data <- apply(data,2,max)
min_data <- apply(data,2, min)
scaled <- data.frame(scale(data,center = min_data, scale=max_data-min_data))

data$Private <- private

scaled$Private <- private
set.seed(0)

index = sample(1:nrow(data),round(0.70*nrow(data)))
train_data <- as.data.frame(scaled[index,])
test_data <- as.data.frame(scaled[-index,])

n = names(train_data)
f <- as.formula(paste("Private ~", paste(n[!n %in% "Private"], collapse = " + ")))
nn <- neuralnet(f,data=train_data,hidden=c(5,4),linear.output=F)

plot(nn)

pr.nn <- compute(nn, test_data[,1:17])

pr.nn$net.result <-sapply(pr.nn$net.result,round,digits=0)

table(test_data$Private,pr.nn$net.result)


ACC <- (61+152)/ (61+152+8+12)


#TREE

# recursive partioning and regression trees 
fit_tree <- rpart(f,method="class",data=train_data )
tree_predict <- predict(fit_tree,test_data, type="class")
#mean square
table(test_data$Private, tree_predict)
ACC_tree <- (58+159)/ (58+159+5+11)


