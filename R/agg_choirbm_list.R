#' Converts a list of CBMs to a single data frame
#'
#' Takes a list of data frames where each data frame is the CBM of a patient
#' and the values column is a binary endorsement of the CBM segment. Then it
#' collapses the information to a single data frame for plotting by adding
#' the 'value' columns of each data frame.
#'
#' @param cbm_list a list of CBMs to collapse
#' @return map_df a single CBM data frame with the value column summed.
#' @export
#'
#' @examples
#' \dontrun{
#' data(validation)
#' cbm_list <- lapply(validation[["bodymap_regions_csv"]], string_to_map)
#' agg_df <- agg_choirbm_list(cbm_list)
#' }
agg_choirbm_list <- function(cbm_list) {
  map_df <- data.frame(
    cbm_list[[1]][1]
    , Reduce(`+`, lapply(cbm_list, `[`, "value"))
  )
  map_df[["group"]] <- factor(
    ifelse(as.numeric(map_df[["id"]]) < 200, "Front", "Back")
    , levels = c("Front", "Back"))
  return(map_df)
}
