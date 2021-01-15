#' Plot the front part of the male CHOIR Body Map
#'
#' Creates a new plot of the front side of the male CHOIR body map.
#'
#' @param df data.frame
#' @return ggrob
#' @export
#'
#' @examples
plot_male_front_choirbm <- function(df){
  datapoly <- merge(df, male_front_poly_coords_df, by = c("id"))
  p <- ggplot2::ggplot(datapoly) +
    ggplot2::aes(x = x, y = y) +
    ggplot2::geom_polygon(ggplot2::aes(fill = value, group = id), color = "black", size = 1.5) +
    ggplot2::scale_y_reverse() +
    ggplot2::theme_void() +
    ggplot2::theme(legend.position = "None")
  return(p)
}
