
<!-- README.md is generated from README.Rmd. Please edit that file -->

# CHOIRBM

<!-- badges: start -->
<!-- badges: end -->

The goal of CHOIRBM is to …

## Installation

You can install the released version of CHOIRBM from
[CRAN](https://CRAN.R-project.org) with:

``` r
install.packages("CHOIRBM")
```

Or install from GitHub with:

``` r
devtools::install_github("emcramer/CHOIRBM")
```

## Example

This is a basic example which shows you how to the front part of the
male CHOIR Body Map:

``` r
library(CHOIRBM)

# generate some random example data
ids <- as.factor(as.character(seq.int(101, 136, 1)))
values <- data.frame(
  id = ids
  , value = runif(length(ids))
)

# plot the data on the front of the CHOIR body map
plot_male_front_choirbm(values)
```

<img src="man/figures/README-example-1.png" width="100%" />
