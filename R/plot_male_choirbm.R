#' Plot the male CHOIR Body Map
#'
#' Creates a new plot of the male CHOIR body map, with the option to sweitch between front and back.
#'
#' @param df data.frame
#' @return ggrob
#' @export
#'
#' @examples
plot_male_choirbm <- function(df){
  positions <- rbind(male_front_poly_coords_df, male_back_poly_coords_df)
  datapoly <- merge(df, positions, by = "id")
  p <- ggplot2::ggplot(datapoly) +
    ggplot2::aes(x = x, y = y) +
    ggplot2::geom_polygon(ggplot2::aes(fill = value, group = id), color = "black", size = 1.5) +
    ggplot2::scale_y_reverse() +
    ggplot2::facet_wrap(~group) +
    ggplot2::theme_void() +
    ggplot2::theme(legend.position = "None")
  return(p)
}
