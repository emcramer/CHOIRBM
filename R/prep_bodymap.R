#' prep_bodymaps
#' converts a single charcter vector of bodymaps into a list of character vectors, each a bodymap
#'
#' @param maps a character vector containing the endorsed bodymap segments of patients in csv form
#'
#' @return a list of character vectors, where each vector contains the patient's endorsed segments
#'
#' @examples
#' exampledata <- data.frame(
#'     GENDER = as.character(c("Male", "Female", "Female")),
#'     BODYMAP_CSV = as.character(c("112,125","112,113","128,117"))
#'  )
#' prep_bodymaps(as.character(exampledata$BODYMAP_CSV))
#' @export

prep_bodymaps <- function(maps){
  # list containing all of the bodymap regions indicated by each patient, by each patient
  segment.list <- strsplit(maps, ",")
  return(segment.list)
}
