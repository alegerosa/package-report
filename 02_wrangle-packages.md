02\_wrangle-packages.R
================
Alejandra
2020-01-27

``` r
library(tidyverse)
```

    ## -- Attaching packages ------------------------------------------------------------------------------------- tidyverse 1.3.0 --

    ## v ggplot2 3.2.1     v purrr   0.3.3
    ## v tibble  2.1.3     v dplyr   0.8.3
    ## v tidyr   1.0.2     v stringr 1.4.0
    ## v readr   1.3.1     v forcats 0.4.0

    ## -- Conflicts ---------------------------------------------------------------------------------------- tidyverse_conflicts() --
    ## x dplyr::filter() masks stats::filter()
    ## x dplyr::lag()    masks stats::lag()

``` r
library(here)
```

    ## here() starts at C:/Users/Alejandra/Documents/2. Passion/Data and websites/wtf-rconf2020/package-report

Create a data frame by reading from data/installed-packages.csv

``` r
ipt <- read_csv(here("data/installed-packages.csv"))
```

    ## Parsed with column specification:
    ## cols(
    ##   Package = col_character(),
    ##   LibPath = col_character(),
    ##   Version = col_character(),
    ##   Priority = col_character(),
    ##   Built = col_character()
    ## )

Filter out the base and recommended packages Keep the variables Package
and Built

``` r
apt <- ipt %>%
  filter(is.na(Priority)) %>%
  select(Package, Built)
```

Write this new, smaller data frame to data/add-on-packages.csv

``` r
write_csv(apt, here("data", "add-on-packages.csv"))
```

Make a frequency table of package by the version in Built

``` r
apt_freqtable <- apt %>%
  count(Built) %>%
  mutate(prop = n / sum(n))
```

Write this data frame to data/add-on-packages-freqtable.csv

``` r
write_csv(apt_freqtable, here("data", "add-on-packages-freqtable.csv"))
```
