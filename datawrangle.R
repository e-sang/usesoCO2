require(tidyverse)
require(broom)

# data
dat <- readxl::read_xlsx("monthly_in_situ_co2_mlo_MOD.xlsx")
data <- dat %>%
  rename("date1" = "Date...3", "date2" = "Date...4", "szn_adj" = "seasonally_adjusted",
         "szn_adj_fit" = "seasonally_adjusted_fit", "CO2_fill" = "CO2_filled",
         "szn_adj_fill" = "seasonally_adjusted_filled")
data[data==-99.99] <- NA



