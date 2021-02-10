context("String maps equal")
test_that("string_to_map yields valid map", {

  # create a simple body map data frame
  ids <- as.character(c(seq.int(101, 136, 1), seq.int(201, 238, 1)))
  sample_df <- data.frame(
    id = ids
    , value = c(1, 1, rep(0, 34), 1, 1, rep(0, 36))
    , group = ifelse(as.numeric(ids) < 200, "Front", "Back")
  )

  # string representation of the data frame
  cbm_str <- "101,102,201,202"

  # generate body map df from string
  test_df <- string_to_map(cbm_str)

  # test each column for equality
  expect_equal(test_df[["id"]], sample_df[["id"]])
  expect_equal(test_df[["value"]], sample_df[["value"]])
  expect_equal(test_df[["group"]], sample_df[["group"]])
})
