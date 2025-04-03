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








