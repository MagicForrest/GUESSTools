#!/usr/bin/Rscript


##########################################################
########### LPJ-GUESS EUROPEAN PFTS ######################
##########################################################


#' @title dummy text
#'
#' @description
#'
#' @details LPJ-GUESS European PFTs
#'
#' @format A list of \code{PFT} objects that store meta-data for standard PFT for supported models
#' @rdname PFT-class
#' @keywords datasets
lpj.euro.PFTs <- list(

  # BOREAL TREES

  Abi_alb = new("Layer",
                id = "Abi_alb",
                name = "Abies alba",
                colour = "blue",
                properties = list(type = "PFT",
                                  lifeform = "Tree",
                                  leafform = "Needleleaved",
                                  phenology = "Evergreen",
                                  zone = "Temperate",
                                  combine = "None")
  ),

  BES = new("Layer",
            id = "BES",
            name = "Boreal Evergreen Shrub",
            colour = "cyan",
            properties = list(type = "PFT",
                              lifeform = "Shrub",
                              leafform = "Unspecified_Leafform",
                              phenology = "Evergreen",
                              zone = "Boreal",
                              combine = "None")
  ),

  "Bet_pen" = new("Layer",
                  id = "Bet_pen",
                  name = "Betula pendula",
                  properties = list(type = "PFT",
                                    lifeform = "Tree",
                                    leafform = "Broadleaved",
                                    phenology = "Summergreen",
                                    zone = "Temperate",
                                    colour = "darkcyan",
                                    combine = "None")
  ),

  Bet_pub = new("Layer",
                id = "Bet_pub",
                name = "Betula pubescens",
                colour = "lightskyblue1",
                properties = list(type = "PFT",
                                  lifeform = "Tree",
                                  leafform = "Broadleaved",
                                  phenology = "Summergreen",
                                  zone = "Boreal",
                                  combine = "None")
  ),

  Car_bet = new("Layer",
                id = "Car_bet",
                name = "Carpinus Betula",
                colour = "peru",
                properties = list(type = "PFT",
                                  lifeform = "Tree",
                                  leafform = "Broadleaved",
                                  phenology = "Summergreen",
                                  zone = "Temperate",
                                  combine = "None")
  ),

  Cor_ave = new("Layer",
                id = "Cor_ave",
                name = "Corylus avellana",
                colour = "saddlebrown",
                properties = list(type = "PFT",
                                  lifeform = "Tree",
                                  leafform = "Broadleaved",
                                  phenology = "Summergreen",
                                  zone = "Temperate",
                                  combine = "None")
  ),

  Fag_syl = new("Layer",
                id = "Fag_syl",
                name = "Fagus Sylvatica",
                colour = "darkgreen",
                properties = list(type = "PFT",
                                  lifeform = "Tree",
                                  leafform = "Broadleaved",
                                  phenology = "Summergreen",
                                  zone = "Temperate",
                                  combine = "None")
  ),

  Fra_exc = new("Layer",
                id = "Fra_exc",
                name = "Fraxinus excelsior",
                colour = "darkgray",
                properties = list(type = "PFT",
                                  lifeform = "Tree",
                                  leafform = "Broadleaved",
                                  phenology = "Summergreen",
                                  zone = "Temperate",
                                  combine = "None")
  ),

  Jun_oxy = new("Layer",
                id = "Jun_oxy",
                name = "Juniperus oxycedrus",
                colour = "darkseagreen4",
                properties = list(type = "PFT",
                                  lifeform = "Shrub",
                                  leafform = "Needleleaved",
                                  phenology = "Evergreen",
                                  zone = "Mediterranean",
                                  combine = "None")
  ),

  MRS = new("Layer",
            id = "MRS",
            name = "Mediterranean Raingreen Shrub",
            colour = "pink",
            properties = list(type = "PFT",
                              lifeform = "Shrub",
                              leafform = "Unspecified_Leafform",
                              phenology = "Raingreen",
                              zone = "Mediterranean",
                              combine = "None")
  ),

  Pic_abi = new("Layer",
                id = "Pic_abi",
                name = "Picea abies",
                colour = "darkslateblue",
                properties = list(type = "PFT",
                                  lifeform = "Tree",
                                  leafform = "Needleleaved",
                                  phenology = "Evergreen",
                                  zone = "Boreal",
                                  combine = "None")
  ),

  Pic_sit = new("Layer",
                id = "Pic_sit",
                name = "Picea sitchensis",
                colour = "black",
                properties = list(type = "PFT",
                                  lifeform = "Tree",
                                  leafform = "Needleleaved",
                                  phenology = "Evergreen",
                                  zone = "Boreal",
                                  combine = "None")
  ),

  Pin_syl = new("Layer",
                id = "Pin_syl",
                name = "Pinus sylvestris",
                colour = "darkorchid4",
                properties = list(type = "PFT",
                                  lifeform = "Tree",
                                  leafform = "Needleleaved",
                                  phenology = "Evergreen",
                                  zone = "Boreal",
                                  combine = "None")
  ),

  Pin_hal = new("Layer",
                id = "Pin_hal",
                name = "Pinus halepensis",
                colour = "orangered",
                properties = list(type = "PFT",
                                  lifeform = "Tree",
                                  leafform = "Needleleaved",
                                  phenology = "Evergreen",
                                  zone = "Mediterranean",
                                  combine = "None")
  ),

  Pop_tre = new("Layer",
                id = "Pop_tre",
                name = "Populus tremula",
                colour = "lightsteelblue3",
                properties = list(type = "PFT",
                                  lifeform = "Tree",
                                  leafform = "Broadleaved",
                                  phenology = "Summergreen",
                                  zone = "Temperate",
                                  combine = "None")
  ),

  Que_coc = new("Layer",
                id = "Que_coc",
                name = "Quercus coccifera",
                colour = "magenta",
                properties = list(type = "PFT",
                                  lifeform = "Shrub",
                                  leafform = "Unspecified_Leafform",
                                  phenology = "Evergreen",
                                  zone = "Mediterranean",
                                  combine = "None")
  ),

  Que_ile = new("Layer",
                id = "Que_ile",
                name = "Quercus ilex",
                colour = "violetred",
                properties = list(type = "PFT",
                                  lifeform = "Tree",
                                  leafform = "Broadleaved",
                                  phenology = "Evergreen",
                                  zone = "Mediterranean",
                                  combine = "None")
  ),

  Que_pub = new("Layer",
                id = "Que_pub",
                name = "Quercus pubescens",
                colour = "springgreen4",
                properties = list(type = "PFT",
                                  lifeform = "Tree",
                                  leafform = "Broadleaved",
                                  phenology = "Summergreen",
                                  zone = "Supra-mediterranean",
                                  combine = "None")
  ),

  Que_rob = new("Layer",
                id = "Que_rob",
                name = "Quercus robur",
                colour = "seagreen3",
                properties = list(type = "PFT",
                                  lifeform = "Tree",
                                  leafform = "Broadleaved",
                                  phenology = "Summergreen",
                                  zone = "Temperate",
                                  combine = "None")
  ),

  Til_cor = new("Layer",
                id = "Til_cor",
                name = "Tilia cordata",
                colour = "limegreen",
                properties = list(type = "PFT",
                                  lifeform = "Tree",
                                  leafform = "Broadleaved",
                                  phenology = "Summergreen",
                                  zone = "Temperate",
                                  combine = "None")
  ),

  Ulm_gla = new("Layer",
                id = "Ulm_gla",
                name = "Ulmus glabra",
                colour = "olivedrab",
                properties = list(type = "PFT",
                                  lifeform = "Tree",
                                  leafform = "Broadleaved",
                                  phenology = "Summergreen",
                                  zone = "Temperate",
                                  combine = "None")
  ),

  C3_gr = new("Layer",
              id = "C3_gr",
              name = "C3 herbacious",
              properties = list(type = "PFT",
                                lifeform = "Grass",
                                leafform = "Unspecified_Leafform",
                                phenology = "GrassPhenology",
                                zone = "Temperate-boreal",
                                colour = "lightgoldenrod1",
                                combine = "None")
  ),

  C4_gr = new("Layer",
              id = "C4_gr",
              name = "C4 herbacious",
              colour = "sienna2",
              properties = list(type = "PFT",
                                lifeform = "Grass",
                                leafform = "Unspecified_Leafform",
                                phenology = "GrassPhenology",
                                zone = "Tropical",
                                combine = "None")
  )
)


