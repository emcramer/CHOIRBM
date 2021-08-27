#' convert_bodymaps
#' Function to convert multiple bodymaps
#'
#' @param f_maps a character vector where each string is a CHOIR bodymap
#' in csv form
#'
#' @return a character vector of bodymaps using the male CHOIR bodymap
#' numberings as a standard. Each bodymap is in csv form
#'
#' @examples
#' exampledata <- data.frame(
#'     GENDER = as.character(c("Male", "Female", "Female")),
#'     BODYMAP_CSV = as.character(c("112,125","112,113","128,117"))
#'  )
#' convert_bodymaps(
#'     as.character(
#'         exampledata$BODYMAP_CSV[exampledata$GENDER == 'Female']
#'      )
#'  )
#' @export

convert_bodymaps <- function(f_maps){
  ret_maps <- c()
  prepped_f_maps <- prep_bodymaps(f_maps)
  # iterate through each of the bodymaps in the vector
  for(i in 1:length(prepped_f_maps)){
    curr_map <- convert_bodymap(prepped_f_maps[[i]])
    flat_map <- paste(curr_map, sep="", collapse = ",")
    ret_maps <- c(ret_maps, flat_map)
  }
  return(ret_maps)
}
