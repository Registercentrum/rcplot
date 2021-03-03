
<!-- README.md is generated from README.Rmd. Please edit that file -->

# slrplotfun

<!-- badges: start -->

[![R-CMD-check](https://github.com/swehip/slrplotfun/workflows/R-CMD-check/badge.svg)](https://github.com/swehip/slrplotfun/actions)
[![Lifecycle:
experimental](https://img.shields.io/badge/lifecycle-experimental-orange.svg)](https://lifecycle.r-lib.org/articles/stages.html#experimental)
<!-- badges: end -->

The goal of slrplotfun is to implement the design used by the Swedish
Arthroplasty Register with figures produced by ggplot2. Functions are
used for the annual report and more.

## Installation

You can install the development version from
[GitHub](https://github.com/) with:

``` r
# install.packages("devtools")
devtools::install_github("swehip/slrplotfun")
```

## Example

Here are some example plots but please see the individual manual pages
for a comprehensive list.

``` r
library(slrplotfun)

# Create some data
df <- data.frame(age = rpois(100000, 65),
  gender = sample(c('Woman', 'Woman', 'Man'), 100000, replace = TRUE))

# Age pyramid
age_pyramid(df, age_var = 'age', gender_var = 'gender',
  man_level = 'Man', title = "This is an age pyramid")
#> Warning: `summarise_()` was deprecated in dplyr 0.7.0.
#> Please use `summarise()` instead.
#> Warning: `group_by_()` was deprecated in dplyr 0.7.0.
#> Please use `group_by()` instead.
#> See vignette('programming') for more help
```

<img src="man/figures/README-example-1.png" width="100%" />

``` r
# Bar plot
bar_plot(df = ggplot2::diamonds, x_var = 'color',
fill_var = 'cut', y_breaks = 2)
#> Warning: `mutate_()` was deprecated in dplyr 0.7.0.
#> Please use `mutate()` instead.
#> See vignette('programming') for more help
```

<img src="man/figures/README-example-2.png" width="100%" />

``` r
# KM-plot with 2 levels
survfit_obj <-
  survival::survfit(survival::Surv(time/365.24, status) ~ sex,
  data = survival::colon
)

# Line plot
line_plot(df = ggplot2::diamonds, x_var = 'cut', color_var = 'color', y_breaks = 2)
```

<img src="man/figures/README-example-3.png" width="100%" />
