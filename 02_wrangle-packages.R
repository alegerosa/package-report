#' ---
#' output: github_document
#' ---

library(tidyverse)
library(here)

##' Create a data frame by reading from data/installed-packages.csv
ipt <- read_csv(here("data/installed-packages.csv"))

##' Filter out the base and recommended packages
##' Keep the variables Package and Built
apt <- ipt %>%
  filter(is.na(Priority)) %>%
  select(Package, Built)

##' Write this new, smaller data frame to data/add-on-packages.csv
write_csv(apt, here("data", "add-on-packages.csv"))

##' Make a frequency table of package by the version in Built
apt_freqtable <- apt %>%
  count(Built) %>%
  mutate(prop = n / sum(n))

##' Write this data frame to data/add-on-packages-freqtable.csv
write_csv(apt_freqtable, here("data", "add-on-packages-freqtable.csv"))
