all_ids <- c(101:136, 201:238)

test_that("comp_choirbm_chi returns one row per segment with expected columns", {
  set.seed(1)
  # every segment endorsed at least once so no segment has a 0/0 share
  a <- string_to_map(paste(c(all_ids, 101, 102, 201), collapse = ","))
  b <- string_to_map(paste(c(all_ids, 101, 201, 201), collapse = ","))
  res <- suppressWarnings(comp_choirbm_chi(list(a = a, b = b), method = "none"))
  expect_equal(nrow(res), 74)
  expect_named(res, c("p.value", "statistic", "parameter"))
  expect_equal(rownames(res)[c(1, 74)], c("101", "238"))
})

# Known issue: a segment endorsed by no group gives 0/0 = NaN and chisq.test() errors.
test_that("comp_choirbm_chi currently errors when a segment is never endorsed", {
  a <- string_to_map("101,102,201,202")
  b <- string_to_map("101,201,201,203")
  expect_error(comp_choirbm_chi(list(a = a, b = b)), "nonnegative and finite")
})
