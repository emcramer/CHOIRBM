#' Examine the effect of a continuous variable on CBM location endorsement
#'
#' @param in_df a data.frame with at least one column for the CBM as a
#' delimited string, and another column as the continuous variable for
#' modeling.
#' @param comp_var the name of the variable to model as a string.
#' @param ... additional parameters passed to glm.
#'
#' @return a data.frame with the following columns: id, term, estimate,
#' std.error, statistic, p.value. Each row is the result of one glm
#' using the continuous variable to predict CBM location endorsement.
#' @export
#'
#' @importFrom broom tidy
#' @importFrom stats glm as.formula p.adjust
#'
#' @examples
#' \dontrun{
#' data(validation)
#' set.seed(123)
#' sampled_data <- validation[sample(1:nrow(validation), 100, replace = FALSE),]
#' model_ouput <- comp_choirbm_glm(sampled_data, "age")
#' }
#'
comp_choirbm_glm <- function(in_df, comp_var, method = "bonferroni", ...) {
  cbm_list <- lapply(
    in_df[["bodymap"]]
    , string_to_map
  )
  cbm_list <- mapply(
    `[<-`
    , cbm_list
    , comp_var
    , value = in_df[[comp_var]]
    , SIMPLIFY = FALSE
  )

  full_data <- do.call(rbind, cbm_list)
  segments <- lapply(
    unique(full_data[["id"]])
    , function(x) subset(full_data, full_data[["id"]] == x)
    )
  models_list <- lapply(
    segments
    , function(x) tidy(
      glm(
        as.formula(paste0("value ~ ", comp_var))
        , data = x
        , ...
      )
    )
  )
  models_df <- cbind(
    "id" = unique(full_data[["id"]])
    , subset(
      do.call(
        rbind
        , models_list
      )
      , term == comp_var
    )
  )
  models_df[["p.value"]] <- p.adjust(
    models_df[["p.value"]]
    , method = method
    )

  # return the
  return(models_df)
}
