# Contributing to CHOIRBM

Bug reports and pull requests are welcome via
[GitHub issues](https://github.com/emcramer/CHOIRBM/issues).

## Development workflow
1. Fork the repo and create a branch from `master`.
2. Install dependencies: `devtools::install_dev_deps()`.
3. Make changes. Document with roxygen2 (`devtools::document()`) and add tests
   in `tests/testthat/`.
4. Run `devtools::test()` and `devtools::check()`; both should be clean.
5. Add a bullet to `NEWS.md` and open a pull request. CI must pass.

`README.md` is generated from `README.Rmd`; edit the latter and run
`devtools::build_readme()`.
