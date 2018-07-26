####################### LON-LAT TO CF INDEX #################################################################################
#' Returns
#'
#'
#'
#'
#' @export
#'

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

