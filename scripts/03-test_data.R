#### Preamble ####
# Purpose: Tests 
# Author: Yihang Xu
# Date: 26 September  2024
# Contact: joker.xu@mail.utoronto.ca
# License: MIT
# Pre-requisites: install.packages("tidyverse")
# Any other information needed? No


#### Workspace setup ####
#install.packages("lintr")
library(lintr)
lint(filename = "/Users/xuyihang/Desktop/Github local/scripts/03-test_data.R")

#install.packages("styler")
library(styler)
style_file(path = "/Users/xuyihang/Desktop/Github local/scripts/03-test_data.R")

library(tidyverse)


#### Test data ####
str(tree_data)  # Check structure
head(tree_data)  # View the first few rows
summary(tree_data)  # Get summary statistics
sum(is.na(tree_data))  # Check for missing values
colSums(is.na(tree_data))  # Check missing values per column
sum(duplicated(tree_data))  # Check for duplicates