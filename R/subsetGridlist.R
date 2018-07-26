#!/usr/bin/Rscript

#' Select a subset of a gridlist
#'
#' Crop a gridlist to an smaller area.  Grridlist taken as a file in the form of a table of text (first and second columsn assume to be longitude and latitude repsective) or a data.frame with columns "Lon" and "Lat".
#' The smaller area is anything from which a raster::Extent can be derived.
#'
#' @param gridlist A character string giving the location of the original gridlist which will be read by read.table and the first two columns will be
#' assumed to be Lon then Lat, _or_ a data.frame wth columns Lon and Lat.
#' @param area  A raster::Extent or a SpatialExtent object specifying the geograpical sub-domain required
#' @param file.name A character string specifying a path to write the new gridlist (can be ignored to write no file)
#' @param header Logical, whether or not the original file has a header
#' @param offset A two-member numeric vector specifying the longitude-latitude offset from the given coordinates
#' to the gridcell centre, ie. should be c(0.25,0.25) for old LPJ-GUESS gridlists, and c(0.0,0.0) for most other more sensible scenarios
#'
#' @return The new gridlist as a data.frame (is also written to a file if file.name is provided)
#'
#' @author Matthew Forrest \email{matthew.forrest@@senckenberg.de}
#' @export
#' @importClassesFrom raster Extent
#' @importMethodsFrom raster extent
subsetGridlist <- function(gridlist, area, file.name, header = TRUE, offset = c(0.0, 0.0)){

  # if necessary read in and check gridlist
  if(is.character(gridlist)) {
    gridlist <- utils::read.table(gridlist, header = header)
    names(gridlist)[1:2]  <- c("Lon", "Lat")
  }
  print(utils::head(gridlist))

  # get extent
  subset.extent <- extent(area)

  # apply offset
  gridlist$Lon <- gridlist$Lon + offset[1]
  gridlist$Lat <- gridlist$Lat + offset[2]

  # crop
  gridlist <- gridlist[which(gridlist$Lon <= subset.extent@xmax
                             & gridlist$Lon >= subset.extent@xmin
                             & gridlist$Lat <= subset.extent@ymax
                             & gridlist$Lat >= subset.extent@ymin), ]

  # offset again
  gridlist$Lon <- gridlist$Lon - offset[1]
  gridlist$Lat <- gridlist$Lat - offset[2]

  # save gridlist and return
  if(!missing(file.name)) utils::write.table(gridlist, file.name, quote = FALSE, row.names = FALSE, col.names = FALSE)
  return(gridlist)

}
