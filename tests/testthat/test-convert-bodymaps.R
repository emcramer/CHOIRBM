test_that("convert_bodymap renumbers female back segments 112-117", {
  expect_equal(
    convert_bodymap(c("112", "113", "114", "115", "116", "117")),
    c("116", "117", "112", "113", "114", "115")
  )
})

test_that("convert_bodymap leaves other segments alone and handles empty input", {
  expect_equal(convert_bodymap(c("101", "201")), c("101", "201"))
  expect_equal(convert_bodymap(character(0)), "")
})

test_that("prep_bodymaps splits csv strings into a list", {
  out <- prep_bodymaps(c("112,125", "128"))
  expect_equal(out, list(c("112", "125"), "128"))
})

test_that("convert_bodymaps converts and re-flattens each map", {
  expect_equal(
    convert_bodymaps(c("112,125", "112,113", "128,117")),
    c("116,125", "116,117", "128,115")
  )
})
