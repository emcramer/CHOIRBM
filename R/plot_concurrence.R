#' Plot a concurrence matrix
#'
#' Generates a concurrence matrix as a heatmap to show which CBM locations are
#' commonly endorsed together.
#'
#' @param con_mat a long form data frame or matrix produced by the
#' plot_concurrence function, with every combination of
#' locations and the number of times each combination occurs.
#' @param ... additional parameters for plotting
#'
#' @return a ggplot heatmap of the concurrence.
#' @export
#'
#' @importFrom rlang .data
#' @importFrom ggplot2 ggplot aes geom_tile labs element_blank
#' @importFrom ggplot2 theme_minimal theme element_text
#'
#' @examples
#' \dontrun{
#' set.seed(123)
#' sampled_data <- validation[sample(1:nrow(validation), 100, replace = FALSE),]
#' con_mat <- comp_concurrence(sampled_data)
#' plot_concurrence(con_mat)
#' }
plot_concurrence <- function(con_mat, ...) {
  p <- ggplot(con_mat) +
    aes(Var1, Var2, fill = .data[["concurrence"]]) +
    geom_tile(color = "white") +
    labs(x = ""
         , y = ""
         , fill = "Concurrence") +
    theme_minimal() +
    theme(
      panel.grid = element_blank()
      , axis.text.x = element_text(angle = 90)
    )
  return(p)
}
