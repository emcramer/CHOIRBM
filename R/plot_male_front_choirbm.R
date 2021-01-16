#' Plot the front part of the male CHOIR Body Map
#'
#' Creates a new plot of the front side of the male CHOIR body map.
#'
#' @param df data.frame
#' @return ggrob
#' @export
#'
#' @examples
#'
#' @importFrom ggplot2 ggplot aes geom_polygon scale_y_reverse facet_wrap theme_void theme
#'
plot_male_front_choirbm <- function(df){
  datapoly <- merge(df, male_front_poly_coords_df, by = c("id"))
  p <- ggplot(datapoly) +
    aes(x = x, y = y) +
    geom_polygon(aes(fill = value, group = id), color = "black", size = 1.5) +
    scale_y_reverse() +
    theme_void() +
    theme(legend.position = "None")
  return(p)
}
