#' Converts a comma-separated string to a CHOIR BM
#'
#' Takes a string of IDs that are separated by a comma and converts the
#' information into a data frame with a binary indication of whether or not
#' an ID appeared. Useful for plotting an individual's CHOIR BM or for
#' isolating particular sections to highlight.
#'
#' @param map_str The delimited CBM string.
#' @param delim The delimiter for the CBM string.
#'
#' @return ret_df data.frame with all of the CHOIR BM segment IDs with a 1
#' if the segment was present and 0 otherwise.
#' @export
#'
#' @examples
#' # from a choir database
#' cbm_str <- "101,102,103,104,201,202"
#' cbm_df <- string_to_map(cbm_str)
#' # plot in a male or female bodymap...
#' plot_male_choirbm(cbm_df, "value")
#'
#' # from a REDCap project
#' cbm_str <- "b07,b18,b19,b23,b24,b28,b33,f01,f03,f08,f17,f27,f29"
#' cbm_df <- string_to_map(cbm_str)
#' # plot in a male or female bodymap...
#' plot_male_choirbm(cbm_df, "value")
#'
#' @importFrom stringr str_split
#'
string_to_map <- function(map_str = "", delim = ",") {
  ids <- as.character(c(seq.int(101, 136, 1), seq.int(201, 238, 1)))
  split_map <- unlist(str_split(map_str, delim))
  split_map <- gsub("f", "1", split_map)
  split_map <- gsub("b", "2", split_map)
  ret_df <- data.frame(
    id = ids
    , group = ifelse(as.numeric(ids) < 200, "Front", "Back")
    , value = as.integer(ids %in% split_map)
  )
  return(ret_df)
}
