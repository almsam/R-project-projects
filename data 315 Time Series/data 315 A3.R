install.packages("RCMinification")
library(RCMinification) 

# 1a nickel
data(nickel)
plot.ts(nickel, main="Nickel Concentrations")
acf(nickel, main="ACF of Nickel Concentrations")

# pattern:   Vaguely sinusoidal
# model:     AR(2) (or higher)



# 1b lynx
data(lynx)
plot.ts(lynx, main="Lynx Trappings")
acf(lynx, main="ACF of Lynx Trappings")

# pattern:   Strong sinusoidal
# model:     AR(2) or AR(3)



# 1c temperatures
source("Globaltemps.R")
data(Globaltemps)
temps <- ts(Globaltemps, start = 1880, end = 2016)
plot.ts(temps, main="Global Temperatures")
acf(temps, main="ACF of Global Temperatures")

# pattern:   Slow decay
# model:     AR(1) (or ARIMA(1,1,0))



# 1d DAX
data(EuStockMarkets)
dax <- EuStockMarkets[,1]  # get 1st column
plot.ts(dax, main="DAX Stock Index")
acf(dax, main="ACF of DAX Stock Index")

dax_log_diff <- diff(log(dax))
plot.ts(dax_log_diff, main="Log-Differenced DAX Stock Index")
acf(dax_log_diff, main="ACF of Log-Differenced DAX Stock Index")

# pattern:   Slow decay (log-diffed may be MA(1))
# model:     ARIMA(0,1,0) before differencing, MA(1) after





# q2:

# 2a nickel
data(nickel)
ma1_model <- arima(nickel, order = c(0, 0, 1))
summary(ma1_model)

# null hyp: H0, theta = 0
# alt hyp: HA, theta =/= 0

# MA1: mu + E(t) + theta*E(t-1)

# the estimated next 2 points are:
# Xhat (T+1) = mu + theta*E(t)
# Xhat (T+2) = mu + theta*E(t+1)

# or if error = 0 { E[error] = 0 }

# Xhat (T+1) = mu
# Xhat (T+2) = mu

mu_hat <- ma1_model$coef[1]
mu_hat

# Xhat (T+1) = 0.226024
# Xhat (T+2) = 0.226024



# 2b Portmanteau 
residuals_ma1 <- residuals(ma1_model)
Box.test(residuals_ma1, lag = 10, type = "Ljung-Box")
# X-squared = 7.7565, df = 10, p-value = 0.6526

# null hyp: H0, residuals ~ white noise
# alt hyp: HA, residuals !~ white noise

# p-value = 0.6526 > 0.05 ==> fail to reject H0 - looks like white noise to me



# 2c forcast 75

forecast_75 <- predict(ma1_model, n.ahead = 1)
forecast_75
Xhat_75 <- forecast_75$pred[1]  # forecasted value
Xhat_75 # 4.566799
se_75 <- forecast_75$se[1]  # SE of value
se_75 # 0.1963826

X_true_75 <- nickel[75]
X_true_75 # 4.3
std_error_75 <- abs(X_true_75 - Xhat_75) / se_75
std_error_75 # 1.35857 - we are 1.35 standard errors from the real value



# 2d forcast the next 2

ar1_model <- arima(nickel, order = c(1, 0, 0))
summary(ar1_model)
forecast_ar1 <- predict(ar1_model, n.ahead = 2)
Xhat_T1_ar1 <- forecast_ar1$pred[1]  # forecast T+1
Xhat_T1_ar1 # 4.545956
Xhat_T2_ar1 <- forecast_ar1$pred[2]  # forecast T+2
Xhat_T2_ar1 # 4.604083
residuals_ar1 <- residuals(ar1_model)
Box.test(residuals_ar1, lag = 10, type = "Ljung-Box")
 # p val = 0.71 >> 0.05
 # looks like white noise aagin
 # AR1 should be a good fit







# q3:


# AR1:
# Yt = mu + phi(y(t-1) - mu) + e(t)

# since the expected error = 0 :
# E[Yt] = mu(1 - phi) + phi*E(Y(t-1))
# mu = E[Yt] = sum (t=1 to n) (Yt)   / n

y <- c(3.2, 3.2, 2.2, 2.3, 1.8, 1.3, 2.2, 2.7)
mu_hat <- mean(y)
mu_hat # 2.3625

# now lets find phi hat:
num <- sum((y[-1] - mu_hat) * (y[-length(y)] - mu_hat))
den <- sum((y - mu_hat)^2)

phi_hat <- num / den
phi_hat # 0.4392857

# since var = sigma squared = var(Yt)*(1 - phi^2)
sigma_hat_sq <- var(y) * (1 - phi_hat^2)
sigma_hat_sq # 0.3480309

# mu    = 2.3625
# phi   = 0.4392857
# sigma = 0.3480309






# q4:

data(longitudinalAcceleration)
acf(longitudinalAcceleration, lag.max=4, plot=TRUE)
rho1 <- acf(longitudinalAcceleration, plot=FALSE)$acf[2]
acf_values <- acf(longitudinalAcceleration, plot = FALSE)$acf[2:5]
rho1_hat <- acf_values[1]

# using rho 1 we can find the theoretical ACF for AR1:
theoretical_acf <- rho1_hat^(1:4)

comparison <- data.frame(
  Lag = 1:4,
  Sample_ACF = acf_values,
  Theoretical_ACF = theoretical_acf
)

print(comparison)
if (all(abs(acf_values - theoretical_acf) < 0.05)) { cat("True") }

# since all(abs(acf_values - theoretical_acf) is < 0.05:
# The sample ACF closely follows the theoretical values, so our AR(1) model is reasonable





# q6:

x <- numeric(10)
x[1] <- 8
for (t in 2:10) {
  x[t] <- 0.8 * x[t-1]
}
# d:
plot(x[-length(x)], x[-1], main="x_t vs x_{t-1}", xlab="x_{t-1}", ylab="x_t", col="light green", pch=19)
# e:
plot(x[-(9:10)], x[-(1:2)], main="x_t vs x_{t-2}", xlab="x_{t-2}", ylab="x_t", col="dark green", pch=19)

# f:
z <- c(-1.2, 0.2, -1.0, 0.5, 1.7, -0.5, -2.1, 1.0, 0.8, -0.1)
x_noise <- numeric(10)
x_noise[1] <- 8 + z[1]
for (t in 2:10) {
  x_noise[t] <- 0.8 * x_noise[t-1] + z[t]
}

x <- numeric(10)
x[1] <- 0.8 * 10 + z[1]
x[2] <- 0.8 * x[1] + z[2]
x[3] <- 0.8 * x[2] + z[3]
x[4] <- 0.8 * x[3] + z[4]
x[1:4]

# f - d:
for (t in 2:10) { x[t] <- 0.8 * x[t-1] + z[t] }
plot(x[-length(x)], x[-1], main="x_t vs x_{t-1}", xlab="x_{t-1}", ylab="x_t", col="blue", pch=19)

# f - e:
plot(x_noise[-(9:10)], x_noise[-(1:2)], main="x_t vs x_{t-2} (With Noise)", xlab="x_{t-2}", ylab="x_t", col="dark blue", pch=19)

# g:
plot(z[-10], z[-1], main="z_t vs z_{t-1}", xlab="z_{t-1}", ylab="z_t", col="purple", pch=19)
plot(z[-(9:10)], z[-(1:2)], main="z_t vs z_{t-2}", xlab="z_{t-2}", ylab="z_t", col="violet", pch=19)













# q7:

# a:
x <- numeric(10)
x[1] <- 1
x[2] <- 0.8 * x[1] - 0.7 * 2
x[3] <- 0.8 * x[2] - 0.7 * x[1]
x[4] <- 0.8 * x[3] - 0.7 * x[2]
x[2:4]
# x2, x3, x4 = -0.600, -1.180, -0.524

# b:
for (t in 3:10) {
  x[t] <- 0.8 * x[t-1] - 0.7 * x[t-2]
}
plot(x[-1], x[-length(x)], main="x_t vs x_{t-1}", xlab="x_{t-1}", ylab="x_t", col="green", pch=19)

# c:
plot(x[3:10], x[1:8], main="x_t vs x_{t-2}", xlab="x_{t-2}", ylab="x_t", col="dark green", pch=19)

# d:
z <- c(-1.2, 0.2, -1.0, 0.5, 1.7, -0.5, -2.1, 1.0, 0.8, -0.1)
x_noise <- numeric(11)
x_noise[1] <- 1
x_noise[2] <- 0.8 * x_noise[1] - 0.7 * 2 + z[1]

for (t in 3:11) {
  x_noise[t] <- 0.8 * x_noise[t-1] - 0.7 * x_noise[t-2] + z[t-1]
}

x_noise[2:4]

plot(x_noise[-1], x_noise[-length(x_noise)], main="x_t vs x_{t-1} (with noise)", xlab="x_{t-1}", ylab="x_t", col="dark blue", pch=19)
plot(x_noise[3:10], x_noise[1:8], main="x_t vs x_{t-2} (with noise)", xlab="x_{t-2}", ylab="x_t", col="purple", pch=19)
