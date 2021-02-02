#' Plot the male CHOIR Body Map
#'
#' Creates a new plot of the front and back of the female CHOIR body map.
#'
#' @param df data.frame
#' @param value string
#' @return ggrob
#' @export
#'
#' @examples
#'
#' @importFrom ggplot2 ggplot aes geom_polygon scale_y_reverse facet_wrap theme_void theme
#' @importFrom rlang .data
#'
plot_female_choirbm <- function(df, value){
  positions <- rbind(female_front_poly_coords_df, female_back_poly_coords_df)
  datapoly <- merge(df, positions, by = "id")
  p <- ggplot(datapoly) +
    aes(x = x, y = y) +
    geom_polygon(aes(fill = .data[[value]], group = .data[["id"]]), color = "black", size = 1.5) +
    scale_y_reverse() +
    facet_wrap(~.data[["group"]]) +
    theme_void() +
    theme(legend.position = "None")
  return(p)
}