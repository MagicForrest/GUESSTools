#' Reads LPJ-GUESS half-degree gridlist
#'
#' Returns (as a data.frame) the standard 59,191 0.5 degree gridcell for a global LPJ-GUESS run as a data.frame.
#'
#'
#' @param type A character specifying "coords" which gives the longitudes and latitides as coordinates,
#' "index" which gives the indices of the gridcells (compatible with the 'cf' input model)
#' or "both" which return both the coordinates indices
#' @param SW.corner A logical, if TRUE specify gridcells by the the south-west corner (useful for old LPJ-GUESS versions)
#'
#' @return A data.frame with all the standard global gridcells
#'
#' @author Matthew Forrest \email{matthew.forrest@@senckenberg.de}
#' @export

getHDGridlist <- function(type = "coords", SW.corner = FALSE) {

  # read the file
  gridlist <- read.table(system.file("extdata", "global_gridlist_cf.txt", package = "GUESSTools"), fill = TRUE, stringsAsFactors = FALSE)

  # clean it up

  # remove brackets
  gridlist$V3 <- gsub('[\\(]', '', gridlist$V3)
  gridlist$V4 <- gsub('[\\(]', '', gridlist$V4)
  gridlist$V4 <- gsub('[\\)]', '', gridlist$V4)
  gridlist$V5 <- gsub('[\\)]', '', gridlist$V5)

  # remove commas
  gridlist$V3 <- gsub('[\\,]', '', gridlist$V3)
  gridlist$V4 <- gsub('[\\,]', '', gridlist$V4)
  gridlist$V5 <- gsub('[\\,]', '', gridlist$V5)

  # as numeric
  gridlist$V3 <- as.numeric(gridlist$V3)
  gridlist$V4 <- as.numeric(gridlist$V4)
  gridlist$V5 <- as.numeric(gridlist$V5)


  # sort out the lons and lats
  get_lat <- function(x) {
    if(!is.na(x[5])) return(x[5])
    else return(x[4])
  }

  get_lon <- function(x) {
    if(!is.na(x[3])) return(x[3])
    else return(x[4])
  }

  Lons <- apply(gridlist, FUN =get_lon, MARGIN = 1)
  Lats <- apply(gridlist, FUN =get_lat, MARGIN = 1)

  if(SW.corner) {
    Lons <- Lons - 0.25
    Lats <- Lats - 0.25
  }

  gridlist$Lon <- Lons
  gridlist$Lat <- Lats

  # tide up

  gridlist$V3 <- NULL
  gridlist$V4 <- NULL
  gridlist$V5 <- NULL

  names(gridlist)[1:2] <- c("Lon_index", "Lat_index")

  # return
  if(tolower(type) == "both") return(gridlist)
  else if(tolower(type) == "index") return(gridlist[,1:2])
  else if(tolower(type) == "coords") return(gridlist[,3:4])
  else stop("Type must be 'coords' or 'index' or 'both'")


}
