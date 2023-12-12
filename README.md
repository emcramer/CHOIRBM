
<!-- README.md is generated from README.Rmd. Please edit that file -->

# CHOIRBM

<!-- badges: start -->
<!-- badges: end -->

CHOIRBM is a collection of plotting utilities for the [Collaborative
Health Outcomes Information Registry’s](https://choir.stanford.edu) Body
Map (CBM). The CBM is an instrument for assessing the distribution of a
patient’s pain, and has been validated in a paper published in [*Pain
Reports* (Scherrer et al
2021)](https://doi.org/10.1097/pr9.0000000000000880). The package is
built on top of the popular R plotting package `ggplot2`, and returns
plots as ggplot objects.

Sample of the CBM in clinical use:
<img src="man/figures/cbm-journal.jpeg" width="100%" />

## Installation

You can install the released version of CHOIRBM from
[CRAN](https://CRAN.R-project.org) with:

``` r
install.packages("CHOIRBM")
```

Or install the development version from GitHub with:

``` r
devtools::install_github("emcramer/CHOIRBM")
remotes::install_github("emcramer/CHOIRBM")

# recommended to build the vignettes, if possible
remotes::install_github("emcramer/CHOIRBM", build_vignettes = TRUE, force = TRUE)
```

## Examples

### Plotting the Male CBM

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
  , ucolors = rainbow(length(ids))
  , group = ifelse(as.numeric(ids) < 200, "Front", "Back")
)

# plot the data on the front of the CHOIR body map
plot_male_choirbm(values, "value")
```

<img src="man/figures/README-male_example-1.png" width="100%" />

``` r
# plot each segment of the bodymap as a different color
plot_male_choirbm(values, "ucolors")
```

<img src="man/figures/README-male_example-2.png" width="100%" />

### Plotting the female CBM

And an additional example with the female CHOIR Body Map:

``` r
library(CHOIRBM)

# generate some random example data
exdata <- gen_example_data()

# plot the data on the front of the CHOIR body map
plot_female_choirbm(exdata, "value")
```

<img src="man/figures/README-female_example-1.png" width="100%" />

Check the vignettes for more examples such as plotting individual
patients, highlighting specific segments, and changing color schemes.

## Citations:

If you use `CHOIRBM` in your work, please cite:

>Cramer E, Ziadni M, Scherrer KH, Mackey S, Kao MC (2022) CHOIRBM: An R package for exploratory data analysis and interactive visualization of pain patient body map data. PLOS Computational Biology 18(10): e1010496. https://doi.org/10.1371/journal.pcbi.1010496

> Scherrer, Kristen Hymel; Ziadni, Maisa S; Kong, Jiang-Tia; Sturgeon,
> John A; Salmasi, Vafia; Hong, Juliette; Cramer, Eric; Chen, Abby L;
> Pacht, Teresa; Olson, Garrick; Darnall, Beth D; Kao, Ming-Chih;
> Mackey, Sean. Development and validation of the Collaborative Health
> Outcomes Information Registry body map, PAIN Reports: January/February
> 2021 - Volume 6 - Issue 1 - p e880 doi:
> [10.1097/PR9.0000000000000880](https://doi.org/10.1097/pr9.0000000000000880)
