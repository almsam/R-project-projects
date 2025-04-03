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

