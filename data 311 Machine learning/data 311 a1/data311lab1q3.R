##q1

possum <- read.csv("~/data311lab1/possum.csv")

str(possum)

##q2

possum <- possum[complete.cases(possum), ]

str(possum)

nrow(possum)

##q3

set.seed(62197256)
n <- nrow(possum)
indicies <- sample(1:n, n)
train_size <- round(0.6*n)
test_size <- n - train_size
train = indicies[1:train_size]
test = indicies[(train_size+1):(train_size+test_size)]
training_data <- possum[train, ]
testing_data <- possum[test, ]

##q4 ##hdlngth

colnames(training_data)

pairs(training_data[6:15])

hdlngth <- training_data$hdlngth

##df <- data.frame(possum[6], possum[8:15])
##pairs(df)
##plot(hdlngth, possum[8:15])

modelAge <- lm(hdlngth ~ training_data$age)
summary(modelAge)
##0.2219
modelSkull <- lm(hdlngth ~ training_data$skullw)
summary(modelSkull)
##0.5944
modelTot <- lm(hdlngth ~ training_data$totlngth)
summary(modelTot)
##0.4349
modelTail <- lm(hdlngth ~ training_data$taill)
summary(modelTail)
##0.02909
modelFoot <- lm(hdlngth ~ training_data$footlgth)
summary(modelFoot)
##0.2281
modelEar <- lm(hdlngth ~ training_data$earconch)
summary(modelEar)
##0.09552
modelEye <- lm(hdlngth ~ training_data$eye)
summary(modelEye)
##0.1444
modelChes <- lm(hdlngth ~ training_data$chest)
summary(modelChes)
##0.3987
modelBelly <- lm(hdlngth ~ training_data$belly)
summary(modelBelly)
##0.3208



modelSite <- lm(hdlngth ~ training_data$site)
summary(modelSite)
##0.1187
modelPop <- lm(hdlngth ~ training_data$Pop)
summary(modelPop)
##0.0456
modelSex <- lm(hdlngth ~ training_data$sex)
summary(modelSex)
##0.0111


possum_slr <- lm(hdlngth ~ training_data$skullw)
lm(hdlngth ~ training_data$skullw)
summary(possum_slr)
## highest r^2 is skull width at 0.5944

##q5q6

possum_mlr <- lm(hdlngth ~ training_data$taill + training_data$Pop)
lm(hdlngth ~ training_data$taill + training_data$Pop)
summary(possum_mlr)

##it seems that possums from victoria have larger heads as the est coeficient for vic is 2.3226
##which is quite large in magnitude & is positive - so it suggests possums from vic have bigger heads

##q7

possum_interact <- lm(hdlngth ~ training_data$taill * training_data$Pop)
lm(hdlngth ~ training_data$taill * training_data$Pop)
summary(possum_interact)

##the relationship seemed to be adequately capured by possum_mlr, so fitting with the interaction term didn't seem necesary

##q8

## y = ( 0.6056 * a ) + ( 2.3226 * b )+ 68.8664
## where a = taill & b = Pop

##q9q10

##q4:
possum_slr <- lm(hdlngth ~ training_data$skullw)
lm(hdlngth ~ training_data$skullw)
s_slr <- summary(possum_slr)

p <- predict.lm(possum_slr, testing_data)[1:40]
mse_slr <- mean((testing_data$hdlngth - p) ^2)
mse_slr

##19.36403

##q5:
possum_mlr <- lm(hdlngth ~ training_data$taill + training_data$Pop)
lm(hdlngth ~ training_data$taill + training_data$Pop)
summary(possum_mlr)

q <- predict.lm(possum_mlr, testing_data)[1:40]
mse_mlr <- mean((testing_data$hdlngth - q) ^2)
mse_mlr

##13.45257

##q7:
possum_interact <- lm(hdlngth ~ training_data$taill * training_data$Pop)
lm(hdlngth ~ training_data$taill * training_data$Pop)
summary(possum_interact)

r <- predict.lm(possum_interact, testing_data)[1:40]
mse_itrct <- mean((testing_data$hdlngth - r) ^2)
mse_itrct

##13.73708

##t <- c( c(mse_slr, "mse_slr"), c(mse_mlr, "mse_mlr"), c(mse_itrct, "mse_itrct") )

##t <- c( c(mse_slr, mse_mlr, mse_itrct), c("mse_slr", "mse_mlr", "mse_itrct"))
##t <- table(t)
##rownames(t) = c("mse_slr", "mse_mlr", "mse_itrct")
##t

##table:

##    mse_itrct:          mse_mlr:            mse_slr: 
##  13.7370828794185    13.4525724013838    19.3640343694998

##I would deem the MLR (multi linear regression) to be the best
##because the main issue I would like to optimize against is minimizing MSE
##so the MLR with the lowest MSE is the best

