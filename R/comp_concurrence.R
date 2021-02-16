#' Calculate the concurrence between locations on the CBM
#'
#' Calculates the raw number of times two locations on the CBM are endorsed
#' together in a data set.
#'
#' @param df a data.frame with the CBMs as delimited strings in a single column.
#'
#' @return a data.frame with every combination of CBM locations and the
#' number of times those locations occur together (the "concurrence").
#' @export
#'
#' @importFrom stats aggregate
#' @importFrom rlang .data
#'
#' @examples
#' \dontrun{
#' set.seed(123)
#' sampled_data <- validation[sample(1:nrow(validation), 100, replace = FALSE),]
#' colnames(sampled_data)[5] <- "bodymap"
#' con_mat <- comp_concurrence(sampled_data)
#' }
comp_concurrence <- function(df) {
  # check to make sure the column is named correctly
  if(!"bodymap" %in% colnames(df)) {
    print("Please rename the body map column to 'bodymap.'")
    return(NULL)
  }
  loc_names <- as.character(c(seq.int(101, 136, 1), seq.int(201, 238, 1)))
  loc_grid <- expand.grid(
    loc_names
    , loc_names
    )

  loc_list <- lapply(
    df[['bodymap']]
    , string_to_map
    )

  # get only the locations that were endorsed together for each pt
  # then bind all rows together
  loc_full <- do.call(
    rbind
    , lapply(loc_list, function(x) {
      present <- subset(x, x[['value']] > 0)
      concur <- subset(
        expand.grid(
          present[['id']]
          , present[['id']]
        )
        , Var1 != Var2
      )
      concur
    }))

  # count duplicate rows
  loc_concur_counts <- aggregate(
    cbind(loc_full[0]
          , concurrence = 1
    )
    , loc_full
    , length
  )

  # merge with the location grid
  final_df <- merge(
    loc_grid
    , loc_concur_counts
    , by = c("Var1", "Var2")
    , all.x = TRUE
  )
  final_df[is.na(final_df)] <- 0
  return(final_df)
}

