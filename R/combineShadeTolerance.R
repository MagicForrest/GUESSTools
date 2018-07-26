#!/usr/bin/Rscript

#'
#' Combine shade-intolerant PFTs with their shade-tolerant cousins
#'
#' The effects of this depend on the shade-tolerant cousin PFTs being defined in the PFT list.  Note that this function modifies the original Field in place,
#' so make a copy of the Field first if you want to keep the old one.  Also it means that it doesn't need to be re-asigned with the "<-" syntax, you can actually just call the function.#'
#' @param x The Field which is to have the shade tolerance classes combined.
#' @param verbose Logical, if TRUE print some progress updates
#' @return Not necessary anything since the Field is modified in place, but it does return Field anyways
#' @author Matthew Forrest \email{matthew.forrest@@senckenberg.de}
#' @export
combineShadeTolerance <- function(x, verbose = FALSE){

  # get the names of the PFTs present
  PFTs.present <- listPFTs(x)

  # combination pairs
  pairs <- list(
    c(tol = "BNE", intol = "BINE"),
    c(tol = "BNE", intol = "IBS"),
    c(tol = "BNE", intol = "BIBS"),
    c(tol = "TeBS", intol = "TeIBS"),
    c(tol = "TrBE", intol = "TrIBE")
  )

  # do the thing
  for(pair in pairs){

    tol <- pair[["tol"]]
    intol <- pair[["intol"]]

    if(tol %in% PFTs.present && intol %in% PFTs.present) {
      if(verbose) message(paste0("Combining PFT ", intol, "with PFT", tol))
      layerOp(x, operator = "sum", layers = c(tol, intol), new.layer = tol)
      layerOp(x, operator = 0, layers = intol)
    }
  }

  # not necessary, layerOps done in place
  return(x)

}
