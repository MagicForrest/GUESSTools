#!/usr/bin/Rscript

#' Select a subset of a gridlist
#'
#' Crop a gridlist (taken as a file in the form of a two-columned table to a smaller subset provided by an Extent object
#'
#' @param gridlist.file A character string giving the location of the original gridlist
#' @param subset.extent  A raster::Extent or a SpatialExtent object specifying the geograpical sub-domain required
#' @param file.name A character string specifying a path to write the new gridlist (can be ignored to write no file)
#' @param header Logical, whether or not the original file has a header
#' @param offset A two-member numeric vector specifying the longitude-latitude offset from the given coordinates
#' to the gridcell centre, ie. should be c(0.25,0.25) for old LPJ-GUESS gridlists, and c(0.0,0.0) for most other more sensible scenarios
#'
#' @return The new gridlist as a data.frame
#'
#' @author Matthew Forrest \email{matthew.forrest@@senckenberg.de}
#' @export
subsetGridlist <- function(gridlist.file, subset.extent, file.name, header = TRUE, offset = c(0.0, 0.0)){


  gridlist <- utils::read.table(gridlist.file, header = header)
  names(gridlist )  <- c("Lon", "Lat")

  print(utils::head(gridlist))

  gridlist$Lon <- gridlist$Lon + offset[1]
  gridlist$Lat <- gridlist$Lat + offset[2]

  gridlist <- gridlist[which(gridlist$Lon <= subset.extent@xmax
                             & gridlist$Lon >= subset.extent@xmin
                             & gridlist$Lat <= subset.extent@ymax
                             & gridlist$Lat >= subset.extent@ymin), ]


  gridlist$Lon <- gridlist$Lon - offset[1]
  gridlist$Lat <- gridlist$Lat - offset[2]

  if(!missing(file.name)) utils::write.table(gridlist, file.name, quote = FALSE, row.names = FALSE)

  return(gridlist)

}


