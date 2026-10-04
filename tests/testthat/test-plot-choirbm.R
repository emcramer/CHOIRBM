test_that("male and female body map plots build without warnings", {
  ids <- c(101:136, 201:238)
  df <- data.frame(
    id = as.character(ids)
    , value = seq_along(ids)
    , group = factor(ifelse(ids < 200, "Front", "Back"), levels = c("Front", "Back"))
  )
  expect_no_warning(ggplot2::ggplot_build(plot_male_choirbm(df, "value")))
  expect_no_warning(ggplot2::ggplot_build(plot_female_choirbm(df, "value")))
})
