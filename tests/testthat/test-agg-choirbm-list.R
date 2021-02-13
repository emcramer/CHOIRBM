context("Collapse CBMs to single df")
test_that("agg_choirbm_list yields valid cbm", {
  # create a simple body map data frame
  ids <- as.character(c(seq.int(101, 136, 1), seq.int(201, 238, 1)))
  true_df <- data.frame(
    id = ids
    , value = c(2, 2, rep(0, 34), 2, 1, rep(0, 36))
    , group = factor(
      ifelse(as.numeric(ids) < 200, "Front", "Back")
      , levels = c("Front", "Back"))
  )

  # sample data frame to process
   samp_proc_df <- data.frame(
     "id" = c("M1", "M2")
     , "regions_csv" = c("101,102,201,202", "101,102,201")
   )

   samp_cbm_list <- lapply(samp_proc_df[["regions_csv"]], string_to_map)

  # generate body map df from string
  test_df <-agg_choirbm_list(samp_cbm_list)

  # test each column for equality
  expect_equal(test_df[["id"]], true_df[["id"]])
  expect_equal(test_df[["value"]], true_df[["value"]])
  expect_equal(test_df[["group"]], true_df[["group"]])
})
