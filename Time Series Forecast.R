pacman::p_load(dplyr, xts, forecast, fpp2, readr)
setwd("/Users/SupremeZhenZhen/Desktop")

amtrak <- read_csv("AmtrakBig.csv")
summary(amtrak)
head(amtrak)

# Convert Data to TS format
amtrak.ts <- ts(amtrak$"Ridership",start = c(2005, 1), frequency = 12 )

# Inspect TS
amtrak.ts
is.ts(amtrak.ts)

# Plot the data without facetting
autoplot(amtrak.ts)
ggseasonplot(amtrak.ts, facet = FALSE)
ggsubseriesplot(amtrak.ts, facet = FALSE)

# Clip data prior to 2005-Jan
amtrak.ts2 <- window(amtrak.ts, start = c(2010, 1))
amtrak.ts2

# Compute lambda value to stabilise variance where needed (Not applicable here as lambda > 1)
amtrak.lambda <- BoxCox.lambda(amtrak.ts2)
print(paste("Lambda value:", amtrak.lambda))

# Plot the data without faceting
autoplot(amtrak.ts2)
ggseasonplot(amtrak.ts2, facet = FALSE)
ggsubseriesplot(amtrak.ts2, facet = FALSE)

# Decompose components
amtrak.decompose <- decompose(amtrak.ts2)
plot(amtrak.decompose)

train <- window(amtrak.ts2, start = c(2010, 1), end = c(2017, 9))
train  
test <-  window(amtrak.ts2, start = c(2017, 10))
test

# Seasonal Naive Method (Baseline)
# Create Model and Forecast
train.snaive <- snaive(train, h = length(test))

# Check Model Summary
summary(train.snaive)

# Check Residuals
checkresiduals(train.snaive)

# Check accuracy
accuracy(train.snaive, test)
autoplot(train.snaive) + autolayer(test)
autoplot(train.snaive) + autolayer(amtrak.ts2, series = "Actual")

# Exponential Smoothing (ETS) Method
# Create Model
train.etsM <- ets(train)

# Create forecast
train.ets <- forecast(train.etsM, h = length(test))

# Check Model Summary
summary(train.etsM)

# Check Residuals
checkresiduals(train.ets)

# Check accuracy
accuracy(train.ets, test)
autoplot(train.ets) + autolayer(test)
autoplot(train.ets) + autolayer(amtrak.ts2, series = "Actual")

# Arima Method
# Create Model
train.arimaM <- auto.arima(train, stepwise = FALSE, approximation = FALSE)

# Create forecast
train.arima <- forecast(train.arimaM, h = length(test))

# Check Model Summary
summary(train.arimaM)

# Check Residuals
checkresiduals(train.arima)

# Check accuracy
accuracy(train.arima, test)
autoplot(train.arima) + autolayer(test)
autoplot(train.arima) + autolayer(amtrak.ts2, series = "Actual")

# Actual Values (Last 6 values)
tail(amtrak, 6)

# Forecast Output
train.snaive
train.ets
train.arima

# TBATS Method
# Create Model
train.tbatsM <- tbats(train, stepwise = FALSE)

# Create forecast
train.tbats <- forecast(train.tbatsM, h = length(test))

# Check Model Summary
summary(train.tbatsM)

# Check Residuals
checkresiduals(train.tbats)

# Check accuracy
accuracy(train.tbats, test)
autoplot(train.tbats) + autolayer(test)
autoplot(train.tbats) + autolayer(amtrak.ts2, series = "Actual")

# Arima Method - Final Deployment
# Create Model
actual.arimaM <- auto.arima(amtrak.ts2, stepwise = FALSE, approximation = FALSE)

# Create forecast
actual.arima <- forecast(actual.arimaM, h = length(test))
actual.arima

# Check Model Summary
summary(actual.arimaM)

# Check Residuals
checkresiduals(actual.arima)

# Check accuracy
autoplot(actual.arima) + autolayer(amtrak.ts2)
autoplot(actual.arima) + autolayer(amtrak.ts2, series = "Actual")

# Exponential Smoothing (ETS) Method - Final Deployment
# Create Model
actual.etsM <- ets(amtrak.ts2)

# Create forecast
actual.ets <- forecast(actual.etsM, h = length(test))
actual.ets

# Check Model Summary
summary(actual.etsM)

# Check Residuals
checkresiduals(actual.ets)

# Check accuracy
autoplot(actual.ets) + autolayer(test)
autoplot(actual.ets) + autolayer(amtrak.ts2, series = "Actual")