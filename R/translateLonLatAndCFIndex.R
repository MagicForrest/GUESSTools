#!/usr/bin/Rscript

######################### LON-LAT TO CF INDEX ##############################
#' @title Convert lon,lat to indices and vice versa
#'
#' @description Handy function to convert gridlists with longitudes and latitudes to coordinate indices, (compatible the 'cf' input module in LPJ-GUESS),
#' and vice versa.  Only works for regular grids.
#'
#' @param lon.lat A data.frame (or data.table) with two columns, one for lon and one for lat (in that order)
#' @param cf.index  Alternatively to the above a data.frame (or data.table) with two columns it the lon and lat indices
#' @param lon.res,lat.res the longitudinal and latitudinal resolutions
#' @param lon.start,lat.start The coordinates of the south west corner of the domain (ie. where to start the indexing from)
#' @param southwest A logical, set to TRUE if the lons and lats describe the southwest corner of the gridcell (as is the case for old LPJ-GUESS gridlists),
#'
#' @details Note, this gives and uses indices starting with '0', which I am pretty sure in what the cf module uses.
#'
#' @return The new gridlist as a data.frame
#'
#' @author Matthew Forrest \email{matthew.forrest@@senckenberg.de}
#' @import data.table
#' @export
#' @examples
#'
#' ### examples for four corners and (0,0)/(0.25,0.25) of a global domain on a 0.5 degree grid
#'
#' ### from lon,lat to index
#'
#' # gridcell centres
#' translateLonLatAndCFIndex(lon.lat = data.frame(Lon = c(-179.75, -179.75, 179.75, 179.75, 0.25),
#'                                                Lat = c(-89.75, 89.75,-89.75, 89.75, 0.25)))
#' # southwest corner
#' translateLonLatAndCFIndex(lon.lat = data.frame(Lon = c(-180, -180, 179.5, 179.5, 0),
#'                                                Lat = c(-90, 89.5, -90, 89.5, 0)), southwest = TRUE)
#'
#'
#' ### from indices to lon,lat
#'
#' # gridcell centres
#' translateLonLatAndCFIndex(cf.index = data.frame(Lon = c(0, 0, 719, 719, 360),
#'                                                 Lat = c(0, 359, 359, 0, 180)))
#' # southwest corner
#' translateLonLatAndCFIndex(cf.index = data.frame(Lon = c(0, 0, 719, 719, 360),
#'                                                 Lat = c(0, 359, 359, 0, 180)), southwest = TRUE)


translateLonLatAndCFIndex <- function(lon.lat = NULL, cf.index = NULL, lon.res = 0.5, lat.res = 0.5, lon.start = -180, lat.start = -90, southwest = FALSE){

  lon.offset <- lon.res
  lat.offset <- lat.res
  if(southwest) {
    lon.offset <- 0
    lat.offset <- 0
  }

  # ERROR - both arguements empty
  if(is.null(lon.lat) && is.null(cf.index)){
    stop("You must provide either lon.lat or cf.index.")
  }
  # ERROR - both arguements specified
  else  if(!is.null(lon.lat) && !is.null(cf.index)){
    stop("You must provide only one of lon.lat or cf.index.")
  }
  # CASE 1 - got lat-lon, return cf index
  else if(!is.null(lon.lat)){

    # make sure it is a data.frame and check it has more than one column
    lon.lat.df <- as.data.frame(lon.lat)
    if(ncol(lon.lat.df) < 2) {   stop("Input data doesn't look right, not enough columns maybe?")}

    # assume first column is longitude
    lons <- lon.lat.df[,1]
    lon.cf.index <- ((lons - lon.start ) / lon.res) - lon.offset
    lon.lat.df[,1] <- lon.cf.index

    # assume second column is latitude
    lats <- lon.lat.df[,2]
    lat.cf.index <- ((lats - lat.start ) / lat.res) - lat.offset
    lon.lat.df[,2] <- lat.cf.index

    return(lon.lat.df)

  }


  # CASE 2 - got cf index, return lat,lon
  else if(!is.null(cf.index)){

    # make sure it is a data.frame and check it has more than one column
    lon.lat.df <- as.data.frame(cf.index)
    if(ncol(lon.lat.df) < 2) {   stop("Input data doesn't look right, not enough columns maybe?")}

    # assume first column is longitude
    lons.cf.index <- lon.lat.df[,1]
    lons <- (lons.cf.index + lon.offset) * lon.res + lon.start
    lon.lat.df[,1] <- lons

    # assume second column is latitude
    lats.cf.index <- lon.lat.df[,2]
    lats <- (lats.cf.index + lat.offset) * lat.res + lat.start
    lon.lat.df[,2] <- lats

    return(lon.lat.df)

  }

}

