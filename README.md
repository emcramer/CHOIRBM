
<!-- README.md is generated from README.Rmd. Please edit that file -->

# CHOIRBM

<!-- badges: start -->
<!-- badges: end -->

The goal of CHOIRBM is to …

## Installation

~~You can install the released version of CHOIRBM from
[CRAN](https://CRAN.R-project.org) with:~~ (Not on CRAN…yet)

``` r
install.packages("CHOIRBM")
```

Or install from GitHub with:

``` r
devtools::install_github("emcramer/CHOIRBM")
```

## Example

This is a basic example which shows you how to plot the front and back
parts of the male CHOIR Body Map:

``` r
library(CHOIRBM)

# generate some random example data
set.seed(123)
ids <- as.character(c(seq.int(101, 136, 1), seq.int(201, 238, 1)))
values <- data.frame(
  id = ids
  , value = runif(length(ids))
  , group = ifelse(as.numeric(ids) < 200, "Front", "Back")
)

# plot the data on the front of the CHOIR body map
plot_male_choirbm(values)
```

<img src="man/figures/README-example-1.png" width="100%" />
