#' Generate Simple Example Data
#'
#' Creates a data frame with CHOIR Body Map segment IDs and a randomly associated value. Also adds grouping information for facetting while plotting.
#'
#' @return values data.frame
#' @export
#'
#' @examples
#'
gen_example_data <- function(){
  ids <- as.character(c(seq.int(101, 136, 1), seq.int(201, 238, 1)))
  values <- data.frame(
    id = ids
    , value = runif(length(ids))
    , group = ifelse(as.numeric(ids) < 200, "Front", "Back")
  )
  return(values)
}
