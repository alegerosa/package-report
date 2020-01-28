#' ---
#' output: github_document
#' ---

library(tidyverse)
library(here)

##' Create a data frame of your installed packages
packages <- as_tibble(installed.packages()) %>% 
  select(Package,
         LibPath,
         Version,
         Priority,
         Built)

write_csv(packages, here("data", "installed-packages.csv"))
