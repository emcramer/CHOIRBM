#' Count the number of areas indicated in a CBM
#'
#' Counts the number of areas a person endorses/indicates on their CHOIR
#' Body Map.
#'
#' @param cbm_str a delimited string of 3-digit codes indicating CBM areas.
#' @param delim the delimiter character, defaults to a comma.
#' @return nareas
#' @export
#'
#' @examples
#' cbm_str <- c("101,102,103,104")
#' num_areas(cbm_str, ",")
num_areas <- function(cbm_str, delim = ",") {
  n <- length(unlist(strsplit(cbm_str, delim)))
  return(n)
}
