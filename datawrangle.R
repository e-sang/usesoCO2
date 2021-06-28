require(tidyverse)
require(broom)

# data
dat <- readxl::read_xlsx("monthly_in_situ_co2_mlo_MOD.xlsx")
data <- dat %>%
  rename("date1" = "Date...3", "date2" = "Date...4", "szn_adj" = "seasonally_adjusted",
         "szn_adj_fit" = "seasonally_adjusted_fit", "CO2_fill" = "CO2_filled",
         "szn_adj_fill" = "seasonally_adjusted_filled")
data[data==-99.99] <- NA

diff <- diff(data$CO2)
data.diff <- ts(diff, start=c(1958,1), frequency=12)

diff12 <- diff(diff,12)

fit1 <- arima(data$CO2, order = c(3,1,1), seasonal = list(order=c(0,1,1),period=12))




