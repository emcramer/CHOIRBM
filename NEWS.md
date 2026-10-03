# CHOIRBM (development version)

* Added GitHub Actions CI (R CMD check, coverage, pkgdown) and contributor docs.
* Fixed `comp_choirbm_chi()` erroring when a segment was endorsed by no group; those segments now return `NA`.
* Replaced deprecated `size` with `linewidth` in the body map plots (requires ggplot2 >= 3.4.0).
* Added tests for `convert_bodymap()`, `convert_bodymaps()`, `prep_bodymaps()`, `comp_choirbm_chi()` and `num_areas()`; moved to testthat edition 3.

---

# CHOIRBM 0.0.3

* Updated the maintainer email address.
* Regenerated documentation so that all function arguments are documented.
* Added functions to fix difference between male and female numbering schemes:
  * `prep_bodymaps()`
  * `convert_bodymap()`
  * `convert_bodymaps()`
* Added `agg_choirbm_list()` for reducing lists of CBMs by addition. 
* Added matching test for `agg_choirbm_list()`.

---

# CHOIRBM 0.0.2

* Fixed a url in the README which was broken.

---

# CHOIRBM 0.0.1

* Simple functionality for plotting male and female CHOIR Body Maps (CBMs).
  - Plotting functions for male and female body maps.
  - Utility function for converting a delimited body map into a plotting-ready
    data frame.
  - Utility function for generating a random data set.
  - Sample data set for examples of data processing and plotting.

---

# CHOIRBM 0.0.0.9000

* Added a `NEWS.md` file to track changes to the package.
