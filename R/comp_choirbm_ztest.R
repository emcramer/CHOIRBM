#' Compare CBM segment endorsement across categorical variable using z-test(s)
#'
#' @param cbm_list a named list of CBMs
#' @param tail whether to do a single or two tailed z test
#' @param p.method the method for p-value corrections
#' @param ... additional parameters passed to p.adjust()
#'
#' @return a data frame with the p-values and z statistic
#' @export
#'
#' @importFrom stats pnorm p.adjust
#'
#' @examples
#' library(CHOIRBM)
#' # isolate and process male data
#' male_data <- validation[validation[["gender"]] == "Male", ]
#' # isolate and process female data
#' female_data <- validation[validation[["gender"]] == "Female", ]
#' comp_choirbm_ztest(list( "male" = male_data, "female" = female_data), tail = "two")
comp_choirbm_ztest <- function(cbm_list, tail = "two",
                               p.method = "bonferroni") {
  # df prep
  df1 <- cbm_list[[1]]
  df2 <- cbm_list[[2]]
  proc_df1 <- agg_choirbm_list(
    lapply(df1[[colnames(df1)[grepl("bodymap|cbm", colnames(df1))]]]
           , string_to_map)
  )
  proc_df2 <- agg_choirbm_list(
    lapply(df2[[colnames(df2)[grepl("bodymap|cbm", colnames(df2))]]]
           , string_to_map)
  )
  ovr <- proc_df1[["value"]] + proc_df2[["value"]]
  p_ovr <- ovr / (nrow(df1) + nrow(df2))
  p_1 <- proc_df1[["value"]] / nrow(df1)
  p_2 <- proc_df2[["value"]] / nrow(df2)
  n_1 <- nrow(df1)
  n_2 <- nrow(df2)
  q <- 1 - p_ovr
  z_scores <- (p_1 - p_2) / sqrt(((p_ovr * q) / n_1) + ((p_ovr * q) / n_2))
  signif <- rep(NA, length(z_scores))
  if(tail == "two") {
    # two tailed
    signif <- 2*pnorm(q = z_scores, lower.tail = FALSE)
  } else if(tail == "left") {
    signif <- pnorm(q = z_scores, lower.tail = TRUE)
  } else if(tail == "right") {
    signif <- pnorm(q = z_scores, lower.tail = FALSE)
  } else {
    print("Error, please provide an appropriate tail parameter
          (two, left, right")
    return(NULL)
  }
  signif <- p.adjust(signif, method = p.method)
  # build summary df to return
  ret_df <- data.frame(
    id = as.character(c(seq.int(101, 136, 1), seq.int(201, 238, 1)))
    , z.score = z_scores
    , p.value = signif
  )
  return(ret_df)
}
