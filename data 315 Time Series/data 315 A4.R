# Q4:

# Q4A:

set.seed(315)
n <- 13
phi <- c(0.8, 0.1)  # AR coefficients
sigma_e <- sqrt(9)  # SD of white noise

# 4 AR(2) time series models:
ts1 <- arima.sim(n=n, model=list(ar=phi), sd=sigma_e)
ts2 <- arima.sim(n=n, model=list(ar=phi), sd=sigma_e)
ts3 <- arima.sim(n=n, model=list(ar=phi), sd=sigma_e)
ts4 <- arima.sim(n=n, model=list(ar=phi), sd=sigma_e)

# plot the time series mods
par(mfrow=c(2,2))
plot(ts1, type="l", main="Series 1", col="blue")
plot(ts2, type="l", main="Series 2", col="red")
plot(ts3, type="l", main="Series 3", col="green")
plot(ts4, type="l", main="Series 4", col="purple")



# Q4B:

n <- 200

# 4 AR(2) time series again
ts1 <- arima.sim(n=n, model=list(ar=phi), sd=sigma_e)
ts2 <- arima.sim(n=n, model=list(ar=phi), sd=sigma_e)
ts3 <- arima.sim(n=n, model=list(ar=phi), sd=sigma_e)
ts4 <- arima.sim(n=n, model=list(ar=phi), sd=sigma_e)

# graph ACF and PACF
par(mfrow=c(2,2))
acf(ts1, main="ACF of Series 1", col="blue")
acf(ts2, main="ACF of Series 2", col="blue")
acf(ts3, main="ACF of Series 3", col="blue")
acf(ts4, main="ACF of Series 4", col="blue")

par(mfrow=c(2,2))
pacf(ts1, main="PACF of Series 1", col="red")
pacf(ts2, main="PACF of Series 2", col="red")
pacf(ts3, main="PACF of Series 3", col="red")
pacf(ts4, main="PACF of Series 4", col="red")

# lets find our theoretical ACF values
acf_theoretical <- ARMAacf(ar=phi, ma=0, lag.max=23)
pacf_theoretical <- ARMAacf(ar=phi, ma=0, lag.max=23, pacf=TRUE)

# n plot
par(mfrow=c(1,2))
plot(acf_theoretical, type="h", main="Theoretical ACF", col="blue")
plot(pacf_theoretical, type="h", main="Theoretical PACF", col="red")




# Q4C:

n <- 1000

# 4 AR(2) time series
ts1 <- arima.sim(n=n, model=list(ar=phi), sd=sigma_e)
ts2 <- arima.sim(n=n, model=list(ar=phi), sd=sigma_e)
ts3 <- arima.sim(n=n, model=list(ar=phi), sd=sigma_e)
ts4 <- arima.sim(n=n, model=list(ar=phi), sd=sigma_e)

# trees plots
par(mfrow=c(2,2))
plot(ts1, type="l", main="Series 1", col="blue")
plot(ts2, type="l", main="Series 2", col="red")
plot(ts3, type="l", main="Series 3", col="green")
plot(ts4, type="l", main="Series 4", col="purple")



# Q4D:

# four AR(2) time series again
ts1 <- arima.sim(n=n, model=list(ar=phi), sd=sigma_e)
ts2 <- arima.sim(n=n, model=list(ar=phi), sd=sigma_e)
ts3 <- arima.sim(n=n, model=list(ar=phi), sd=sigma_e)
ts4 <- arima.sim(n=n, model=list(ar=phi), sd=sigma_e)

# sample stats
stats <- function(ts) {
  mean_val <- mean(ts)
  var_val <- var(ts)
  acf_vals <- acf(ts, lag.max=4, plot=FALSE)$acf[-1]  # drop lag 0
  pacf_vals <- pacf(ts, lag.max=4, plot=FALSE)$acf
  return(list(mean=mean_val, variance=var_val, acf=acf_vals, pacf=pacf_vals))
}

stats1 <- stats(ts1)
stats2 <- stats(ts2)
stats3 <- stats(ts3)
stats4 <- stats(ts4)

# compare with theoretical values
cat("Theoretical ACF (first 4 lags):", acf_theoretical[2:5], "\n")
cat("Theoretical PACF (first 4 lags):", pacf_theoretical[2:5], "\n")

# print sample means, variances, ACF, PACF
stats_list <- list(stats1, stats2, stats3, stats4)
for (i in 1:4) {
  cat("\nSeries", i, "\n")
  print(stats_list[[i]])
}











# Q5:

# Q5c:

set.seed(315)
n <- 1000
phi <- c(0.2, -0.3, 0.1, 0.4)  # AR(4) Coef
sigma_e <- sqrt(4)  # SD of white noise

# AR(4) process
z_t <- arima.sim(n=n, model=list(ar=phi), sd=sigma_e)

# and plot time
par(mfrow=c(1,2))
acf(z_t, main="Sample ACF of AR(4)", col="blue")  # ACF plot
pacf(z_t, main="Sample PACF of AR(4)", col="red")  # PACF













# Q6:

# Q6A:

install.packages("RCMinification")
library(RCMinification) 
data(wolfRMNP)
source("C:/Users/samia/OneDrive/Desktop/fourth year/data 315/wolfRMNP.R")

# graph ACF and PACF
par(mfrow=c(1,2))
acf(wolfRMNP, main="ACF of Wolf Counts", col="blue")  # acf
pacf(wolfRMNP, main="PACF of Wolf Counts", col="red")  # p acf




# Q6B:

p <- 1
ar_model <- arima(wolfRMNP, order=c(p,0,0), method="ML")
summary(ar_model)

# Q6C:

par(mfrow=c(2,2))
plot(ar_model$residuals, type="o", main="Residuals of AR Model", col="blue")
acf(ar_model$residuals, main="ACF of Residuals", col="red")  # I expect no autocorrelation
pacf(ar_model$residuals, main="PACF of Residuals", col="purple")
qqnorm(ar_model$residuals); qqline(ar_model$residuals, col="red")










# Q8:

# Q8C:

#source("zx.R")
source("C:/Users/samia/OneDrive/Desktop/fourth year/data 315/zx.R")
z <- zx$z  # read z series

# graph ACF n PACF
par(mfrow=c(2,1))

acf(z, main="ACF of z_t")
pacf(z, main="PACF of z_t")

# time for our AR(2) model
z.AR2 <- arima(z, order=c(2,0,0))
summary(z.AR2)



# Q8D:

x <- zx$x
n <- length(z)

muZhat <- coef(z.AR2)[3]
z0 <- z - muZhat
z0 <- z0[-n]
x0 <- x[2:n]

x0.lm <- lm(x0 ~ z0)
summary(x0.lm)


