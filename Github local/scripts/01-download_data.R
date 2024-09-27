#### Preamble ####
# Purpose: Downloads and saves the data from pendatatoronto
# Author: Yihang Xu
# Date: 26 September 2024
# Contact: joker.xu@mail.utoronto.ca
# License: MIT
# Pre-requisites: install.packages("tidyverse")
# Any other information needed? No


#### Workspace setup ####
#install.packages("lintr")
library(lintr)
lint(filename = "/Users/xuyihang/Desktop/Github local/scripts/01-download_data.R")

#install.packages("styler")
library(styler)
style_file(path = "/Users/xuyihang/Desktop/Github local/scripts/01-download_data.R")

library(opendatatoronto)
library(tidyverse)

#### Download data ####
marriage_licence_packages <- search_packages("Street Tree Data")
marriage_licence_packages
# Retrieve a list of all resources (datasets) available within the found package
marriage_licence_resources <- marriage_licence_packages %>%
  list_package_resources()
# Display the list of resources available in the "Marriage Licence Statistics" package
marriage_licence_resources

marriage_licence_statistics <- marriage_licence_resources[4,] %>%
  get_resource()
the_raw_data=marriage_licence_statistics



#### Save data ####
tree_data <- the_raw_data
# change the_raw_data to whatever name you assigned when you downloaded it.
write_csv(tree_data, "/Users/xuyihang/Desktop/Github local/data/tree_data.csv") 

         
