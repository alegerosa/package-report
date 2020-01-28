01\_write-installed-packages.R
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

create a data frame of your installed packages

``` r
packages <- as_tibble(installed.packages()) %>% 
  select(Package,
         LibPath,
         Version,
         Priority,
         Built)

write_csv(packages, here("data", "installed_packages.csv"))
```
