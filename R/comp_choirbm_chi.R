#' Compare CBM segment endorsement across categorical variable using Chi-Square
#'
#' @param cbm_list a named list of CBMs
#' @param ... additional parameters passed to p.adjust()
#'
#' @return a data frame with the p-values, chi statistic, and degrees of freedom
#' @export
#'
#' @importFrom stats chisq.test p.adjust
#'
#' @examples
#' \dontrun{
#' data(validation)
#' # split male and female data
#' male_data <- validation[validation[['gender']] == "Male", ]
#' male_bodymap_list <- lapply(
#'  male_data[["bodymap_regions_csv"]]
#'  , string_to_map)
#' male_bodymap_df <- agg_choirbm_list(male_bodymap_list)
#' female_data <- validation[validation[['gender']] == "Female", ]
#' female_bodymap_list <- lapply(
#'  female_data[["bodymap_regions_csv"]]
#'  , string_to_map)
#' female_bodymap_df <- agg_choirbm_list(female_bodymap_list)
#' # compare with chi square test
#' chi_res <- comp_choirbm_chi(
#'  list("male" = male_bodymap_df
#'  , "female" = female_bodymap_df)
#'  , method = 'bonferroni'
#' )
#' }
comp_choirbm_chi <- function(cbm_list, ...) {

  # get the number of groups to compare and the names of the groups
  n_groups <- length(cbm_list)
  cbm_names <- names(cbm_list)

  # get total endorsement and percent
  total_value <- Reduce(`+`, lapply(cbm_list, `[`, "value"))[, 1]

  perc_values <- do.call(
    cbind
    , lapply(cbm_list, function(x) x[["value"]] / total_value)
  )
  names(perc_values) <- cbm_names

  # chi-square test for comparisons on each segment
  x2_res <- apply(
    perc_values
    , 1
    , function(x) chisq.test(
      x
      , p = rep(1 / n_groups, n_groups)
      , simulate.p.value = TRUE)
  )

  chisumry <- function(x) {
    data.frame(
      "p.value" = x[["p.value"]]
      , "statistic" = x[["statistic"]]
      , "parameter" = x[["parameter"]]
      , row.names = NULL
    )
  }

  x2_df <- do.call(
    rbind
    , lapply(x2_res, chisumry)
  )
  row.names(x2_df) <- as.character(
    c(seq.int(101, 136, 1)
      , seq.int(201, 238, 1))
  )
  x2_df[["p.value"]] <- p.adjust(x2_df[["p.value"]], ...)

  # return the final data frame
  return(x2_df)
}
