#' Plots a histogram of the number of CBM areas indicated
#'
#' This is a wrapper for ggplot2's histogram function that incorporates
#' calculating the number of CBM areas each individual indicates.
#'
#' @param cbms a list of delimited CBM strings
#' @param ... additional arguments passed to geom_histogram
#'
#' @return a histogram of the number of CBM areas endorsed by individuals in
#' the dataset.
#' @export
#'
#' @importFrom ggplot2 ggplot aes geom_histogram theme_minimal labs theme
#' @importFrom ggplot2 element_blank
#'
#' @examples
#' \dontrun{
#' data(validation)
#' below20 <- validation[
#'  sapply(validation$bodymap_regions_csv, num_areas) < 20
#'  , ]
#' plot_nareas_histogram(
#'  below20$bodymap_regions_csv
#'  , binwidth = 1
#'  , fill = "grey"
#'  , color = "white")
#' }
plot_nareas_histogram <- function(cbms, ...) {
  nareas <- as.data.frame(sapply(cbms, num_areas))
  names(nareas) <- "nareas"
  p <- ggplot(nareas) +
    aes(x = nareas) +
    geom_histogram(...) +
    labs(
      title = "Distribution of the number of CBM areas endorsed"
      , y = "Number of individuals"
      , x = "Number of areas"
    ) +
    theme_minimal() +
    theme(
      panel.grid.major.x = element_blank()
      , panel.grid.minor.x = element_blank()
    )
  return(p)
}
