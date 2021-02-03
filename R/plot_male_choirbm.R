#' Plot the male CHOIR Body Map
#'
#' Creates a new plot of the male CHOIR body map, with the option to sweitch between front and back.
#'
#' @param df data.frame
#' @param value string
#' @return ggrob
#' @export
#'
#' @examples
#' cbm_df <- gen_example_data()
#' plot_male_choirbm(cbm_df, "value")
#'
#' @importFrom ggplot2 ggplot aes geom_polygon scale_y_reverse facet_wrap theme_void theme
#' @importFrom rlang .data
#'
plot_male_choirbm <- function(df, value){
  positions <- rbind(male_front_poly_coords_df, male_back_poly_coords_df)
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
