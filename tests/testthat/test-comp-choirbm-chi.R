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

test_that("comp_choirbm_chi returns NA for segments never endorsed", {
  set.seed(1)
  a <- string_to_map("101,102,201,202")
  b <- string_to_map("101,201,201,203")
  res <- suppressWarnings(comp_choirbm_chi(list(a = a, b = b), method = "none"))
  expect_equal(nrow(res), 74)
  expect_true(is.na(res["103", "p.value"]))
  expect_false(is.na(res["101", "p.value"]))
})
