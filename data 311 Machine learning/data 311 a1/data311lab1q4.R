##setup:

possum <- read.csv("~/data311lab1/possum.csv")
str(possum)

possum <- possum[complete.cases(possum), ]
str(possum)
nrow(possum)

set.seed(62197256)
n <- nrow(possum)
indicies <- sample(1:n, n)
train_size <- round(0.6*n)
test_size <- n - train_size
train = indicies[1:train_size]
test = indicies[(train_size+1):(train_size+test_size)]
training_data <- possum[train, ]
testing_data <- possum[test, ]

colnames(training_data)
pairs(training_data[6:15])
hdlngth <- training_data$hdlngth

##library(class)
library(FNN)

length(training_data$totlngth)
length(training_data$hdlngth)

training_data[,'class']=factor(training_data[,'class'])
testing_data[,'class']=factor(testing_data[,'class'])

##knn1(training_data$totlngth, training_data$hdlngth, 2)

##knn1(training_data[1:40], testing_data, 2)

knn(train=training_data$hdlngth[0:40], test=testing_data$hdlngth[0:40], cl=training_data$hdlngth[0:40], k=2)

##############

##4a:

train <- training_data$hdlngth
YYY <- training_data$totlngth
k2 <- FNN::knn.reg(train, test=NULL, y=YYY, k=2)

##4b:

##q <- predict.lm(possum_mlr, testing_data)[1:40]
##mse_mlr <- mean((testing_data$hdlngth - q) ^2)
##mse_mlr

summary(k2)
q <- residuals(k2)
k2_mse <- mean((testing_data$hdlngth - q[1:40]) ^2)
k2_mse

####

##k2 <- FNN::knn.reg(train, test=NULL, y=YYY, k=2)
##q <- residuals(k2)
##k2_mse <- mean((testing_data$hdlngth - q[1:40]) ^2)
##k2_mse

k3 <- FNN::knn.reg(train, test=NULL, y=YYY, k=3)
q <- residuals(k3)
k3_mse <- mean((testing_data$hdlngth - q[1:40]) ^2)
k3_mse

k4 <- FNN::knn.reg(train, test=NULL, y=YYY, k=4)
q <- residuals(k4)
k4_mse <- mean((testing_data$hdlngth - q[1:40]) ^2)
k4_mse

k5 <- FNN::knn.reg(train, test=NULL, y=YYY, k=5)
q <- residuals(k5)
k5_mse <- mean((testing_data$hdlngth - q[1:40]) ^2)
k5_mse

k6 <- FNN::knn.reg(train, test=NULL, y=YYY, k=6)
q <- residuals(k6)
k6_mse <- mean((testing_data$hdlngth - q[1:40]) ^2)
k6_mse

k7 <- FNN::knn.reg(train, test=NULL, y=YYY, k=7)
q <- residuals(k7)
k7_mse <- mean((testing_data$hdlngth - q[1:40]) ^2)
k7_mse

k8 <- FNN::knn.reg(train, test=NULL, y=YYY, k=8)
q <- residuals(k8)
k8_mse <- mean((testing_data$hdlngth - q[1:40]) ^2)
k8_mse

k9 <- FNN::knn.reg(train, test=NULL, y=YYY, k=9)
q <- residuals(k9)
k9_mse <- mean((testing_data$hdlngth - q[1:40]) ^2)
k9_mse

k10 <- FNN::knn.reg(train, test=NULL, y=YYY, k=10)
q <- residuals(k10)
k10_mse <- mean((testing_data$hdlngth - q[1:40]) ^2)
k10_mse

k11 <- FNN::knn.reg(train, test=NULL, y=YYY, k=11)
q <- residuals(k11)
k11_mse <- mean((testing_data$hdlngth - q[1:40]) ^2)
k11_mse

k12 <- FNN::knn.reg(train, test=NULL, y=YYY, k=12)
q <- residuals(k12)
k12_mse <- mean((testing_data$hdlngth - q[1:40]) ^2)
k12_mse

k13 <- FNN::knn.reg(train, test=NULL, y=YYY, k=13)
q <- residuals(k13)
k13_mse <- mean((testing_data$hdlngth - q[1:40]) ^2)
k13_mse

k14 <- FNN::knn.reg(train, test=NULL, y=YYY, k=14)
q <- residuals(k14)
k14_mse <- mean((testing_data$hdlngth - q[1:40]) ^2)
k14_mse

k15 <- FNN::knn.reg(train, test=NULL, y=YYY, k=15)
q <- residuals(k15)
k15_mse <- mean((testing_data$hdlngth - q[1:40]) ^2)
k15_mse

k16 <- FNN::knn.reg(train, test=NULL, y=YYY, k=16)
q <- residuals(k16)
k16_mse <- mean((testing_data$hdlngth - q[1:40]) ^2)
k16_mse

k17 <- FNN::knn.reg(train, test=NULL, y=YYY, k=17)
q <- residuals(k17)
k17_mse <- mean((testing_data$hdlngth - q[1:40]) ^2)
k17_mse

k18 <- FNN::knn.reg(train, test=NULL, y=YYY, k=18)
q <- residuals(k18)
k18_mse <- mean((testing_data$hdlngth - q[1:40]) ^2)
k18_mse

k19 <- FNN::knn.reg(train, test=NULL, y=YYY, k=19)
q <- residuals(k19)
k19_mse <- mean((testing_data$hdlngth - q[1:40]) ^2)
k19_mse

k20 <- FNN::knn.reg(train, test=NULL, y=YYY, k=20)
q <- residuals(k20)
k20_mse <- mean((testing_data$hdlngth - q[1:40]) ^2)
k20_mse

k2_mse
k3_mse
k4_mse
k5_mse
k6_mse
k7_mse
k8_mse
k9_mse
k10_mse
k11_mse
k12_mse
k13_mse
k14_mse
k15_mse
k16_mse
k17_mse
k18_mse
k19_mse
k20_mse

k4_mse
##k=4 has the smallest MSE at 8693.271 

##q4d:

train <- training_data$hdlngth
##YYY <- c(training_data$pop, training_data$totlngth)
YYY <- training_data$taill
kFinal <- FNN::knn.reg(train, test=NULL, y=YYY, k=2)
q <- residuals(kFinal)
kF_mse <- mean((testing_data$hdlngth - q[1:40]) ^2)
kF_mse

## the lowest MSE I could get was 8717.037, so the final model is k=4
