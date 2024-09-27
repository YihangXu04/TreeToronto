#### Preamble ####
# Purpose: Simulates the original dataset
# Author: Yihang Xu
# Date: 26 September  2024
# Contact: joker.xu@mail.utoronto.ca
# License: MIT
# Pre-requisites: install.packages("tidyverse"), install.packages("stringi")
# Any other information needed? No


#### Workspace setup ####

#install.packages("lintr")
library(lintr)
lint(filename = "/Users/xuyihang/Desktop/Github local/scripts/00-simulate_data.R")

#install.packages("styler")
library(styler)
style_file(path = "/Users/xuyihang/Desktop/Github local/scripts/00-simulate_data.R")

library(tidyverse)
library(dplyr)
library(stringi)

#### Simulate data ####
# Set seed for reproducibility
set.seed(123)
# Function to generate random street names
generate_street_name <- function(n) {
  paste(stri_rand_strings(n, 8, '[A-Za-z]'), "St")
}
# Create a simulated dataset
simulate_data <- function(n) {
  data.frame(
    X_id = 1:n,
    OBJECTID = sample(1:100000, n, replace = TRUE),
    STRUCTID = sample(1:100000, n, replace = TRUE),
    ADDRESS = sample(1:5000, n, replace = TRUE),
    STREETNAME = generate_street_name(n),
    CROSSSTREET1 = generate_street_name(n),
    CROSSSTREET2 = generate_street_name(n),
    DBH_TRUNK = round(runif(n, min = 5, max = 100), 1),  # Simulate tree diameters
    WARD = sample(1:25, n, replace = TRUE),  # 25 wards
    BOTANICAL_NAME = sample(c("Picea pungens", "Betula papyrifera", "Acer saccharinum"), n, replace = TRUE),
    COMMON_NAME = sample(c("Colorado Blue Spruce", "White Birch", "Silver Maple"), n, replace = TRUE),
    geometry = paste0("POINT (", runif(n, -79.6, -79.3), " ", runif(n, 43.6, 43.9), ")")  # Simulate geographic coordinates
  )
}
# Simulate a dataset with 1000 rows
simulated_data <- simulate_data(1000)
# View the first few rows
head(simulated_data)
write.csv(simulated_data, file = "simulated_tree_data.csv", row.names = FALSE)



