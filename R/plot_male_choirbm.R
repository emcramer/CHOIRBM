#' Plot the male CHOIR Body Map
#'
#' Creates a new plot of the male CHOIR body map, with the option to sweitch between front and back.
#'
#' @param df data.frame
#' @param face character, either 'f' or 'b' indicating front or back
#' @return ggrob
#' @export
#'
#' @examples
plot_male_choirbm <- function(df, face = "f"){
  datapoly <- ifelse(
    face == "f"
    , merge(df, male_front_poly_coords_df, by = c("id"))
    , merge(df, male_back_poly_coords_df, by = c("id")))
  p <- ggplot2::ggplot(datapoly) +
    ggplot2::aes(x = x, y = y) +
    ggplot2::geom_polygon(ggplot2::aes(fill = value, group = id), color = "black", size = 1.5) +
    ggplot2::scale_y_reverse() +
    ggplot2::theme_void() +
    ggplot2::theme(legend.position = "None")
  return(p)
}
