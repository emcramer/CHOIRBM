#' Generate Simple Example Data
#'
#' Creates a data frame with CHOIR Body Map segment IDs and a randomly
#' associated value. Also adds grouping information for facetting while
#' plotting.
#'
#' @param seed integer to seed the random number generator
#' @return values data.frame
#' @export
#'
#' @examples
#' cbm_df <- gen_example_data()
#' head(cbm_df)
#'
#' @importFrom stats runif
#'
gen_example_data <- function(seed = 123) {
  ids <- as.character(c(seq.int(101, 136, 1), seq.int(201, 238, 1)))
  set.seed(seed = seed)
  values <- data.frame(
    id = ids
    , value = runif(length(ids))
    , group = factor(
      ifelse(
        as.numeric(ids) < 200
        , "Front"
        , "Back"
        )
      , levels = c("Front", "Back")
      )
  )
  return(values)
}
