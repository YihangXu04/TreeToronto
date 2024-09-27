#### Preamble ####
# Purpose: Cleans the raw data by removing outliers.
# Author: Yihang Xu
# Date: 26 September 2024
# Contact: joker.xu@mail.utoronto.ca
# License: MIT
# Pre-requisites: install.packages("tidyverse")
# Any other information needed? No

#### Workspace setup ####
#install.packages("lintr")
library(lintr)
lint(filename = "/Users/xuyihang/Desktop/Github local/scripts/02-data_cleaning.R")

#install.packages("styler")
library(styler)
style_file(path = "/Users/xuyihang/Desktop/Github local/scripts/02-data_cleaning.R")

library(tidyverse)

# Filter and Clean Data
data <- read_csv(here::here("/Users/xuyihang/Desktop/Github local/data/data1.csv"))
sampled_data <- data %>% sample_frac(0.1)

# Remove outliers using the IQR method for DBH
Q1 <- quantile(sampled_data$DBH_TRUNK, 0.25, na.rm = TRUE)
Q3 <- quantile(sampled_data$DBH_TRUNK, 0.75, na.rm = TRUE)
IQR <- Q3 - Q1
lower_bound <- Q1 - 1.5 * IQR
upper_bound <- Q3 + 1.5 * IQR

cleaned_data <- sampled_data %>%
  filter(DBH_TRUNK >= lower_bound & DBH_TRUNK <= upper_bound)

#### Save data ####
write_csv(cleaned_data, "/Users/xuyihang/Desktop/Github local/data/cleaned_data.csv")