#' Compare CBM segment endorsement across categorical variable using z-test(s)
#'
#' @param cbm_list a named list of CBMs
#' @param ... additional parameters passed to p.adjust()
#'
#' @return a data frame with the p-values and z statistic
#' @export
#'
#' @importFrom stats pnorm p.adjust
#'
#' @examples
comp_choirbm_ztest <- function(df1, df2, tail = "two", p.method = "bonferroni") {
  # df prep
  proc_df1 <- agg_choirbm_list(
    lapply(df1[["bodymap_regions_csv"]]
           , string_to_map)
  )
  proc_df2 <- agg_choirbm_list(
    lapply(df2[["bodymap_regions_csv"]]
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
