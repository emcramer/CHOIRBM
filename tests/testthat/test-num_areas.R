test_that("num_areas counts delimited segments", {
  expect_equal(num_areas("101,102,201"), 3)
  expect_equal(num_areas("101;102", delim = ";"), 2)
  expect_equal(num_areas("101"), 1)
})
