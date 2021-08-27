#' convert_bodymap
#' Helper function to convert a single bodymap
#' @param segments a character vector containing segment numbers as individual
#' strings in the vector that need to be adjusted/standardized
#' @return a character vector containing standardized segment numbers as
#' individual strings in the vector
#'
#' @examples
#' exampledata <- data.frame(
#'     GENDER = as.character(c("Male", "Female", "Female")),
#'     BODYMAP_CSV = as.character(c("112,125","112,113","128,117"))
#'  )
#' convert_bodymap(exampledata[2,2])
#' @export

convert_bodymap <- function(segments){
  if(length(segments) == 0){
    return("")
  }
  for(i in 1:length(segments)){
    # for each segment, check to see if it needs to be set to the
    # male numbering
    if(segments[i] == "112"){
      segments[i] <- "116"
    } else if(segments[i] == "113"){
      segments[i] <- "117"
    } else if(segments[i] == "114"){
      segments[i] <- "112"
    } else if(segments[i] == "115"){
      segments[i] <- "113"
    } else if(segments[i] == "116"){
      segments[i] <- "114"
    } else if(segments[i] == "117"){
      segments[i] <- "115"
    }
  }
  return(segments)
}
