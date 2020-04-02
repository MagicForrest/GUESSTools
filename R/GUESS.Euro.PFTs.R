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
  
  Abi_alb = new("PFT",
                id = "Abi_alb",
                name = "Abies alba",
                lifeform = "Tree",
                leafform = "Needleleaved",
                phenology = "Evergreen",
                zone = "Temperate",
                colour = "blue",
                combine = "None"
  ),
  
  BES = new("PFT",
            id = "BES",
            name = "Boreal Evergreen Shrub",
            lifeform = "Shrub",
            leafform = "Unspecified_Leafform",
            phenology = "Evergreen",
            zone = "Boreal",
            colour = "cyan",
            combine = "None"
  ),
  
  "Bet_pen" = new("PFT",
                  id = "Bet_pen",
                  name = "Betula pendula",
                  lifeform = "Tree",
                  leafform = "Broadleaved",
                  phenology = "Summergreen",
                  zone = "Temperate",
                  colour = "darkcyan",
                  combine = "None"
  ),
  
  Bet_pub = new("PFT",
                id = "Bet_pub",
                name = "Betula pubescens",
                lifeform = "Tree",
                leafform = "Broadleaved",
                phenology = "Summergreen",
                zone = "Boreal",
                colour = "lightskyblue1",
                combine = "None"
  ),
  
  Car_bet = new("PFT",
                id = "Car_bet",
                name = "Carpinus Betula",
                lifeform = "Tree",
                leafform = "Broadleaved",
                phenology = "Summergreen",
                zone = "Temperate",
                colour = "peru",
                combine = "None"
  ),
  
  Cor_ave = new("PFT",
                id = "Cor_ave",
                name = "Corylus avellana",
                lifeform = "Tree",
                leafform = "Broadleaved",
                phenology = "Summergreen",
                zone = "Temperate",
                colour = "saddlebrown",
                combine = "None"
  ),
  
  Fag_syl = new("PFT",
                id = "Fag_syl",
                name = "Fagus Sylvatica",
                lifeform = "Tree",
                leafform = "Broadleaved",
                phenology = "Summergreen",
                zone = "Temperate",
                colour = "darkgreen",
                combine = "None"
  ),
  
  Fra_exc = new("PFT",
                id = "Fra_exc",
                name = "Fraxinus excelsior",
                lifeform = "Tree",
                leafform = "Broadleaved",
                phenology = "Summergreen",
                zone = "Temperate",
                colour = "darkgray",
                combine = "None"
  ),
  
  Jun_oxy = new("PFT",
                id = "Jun_oxy",
                name = "Juniperus oxycedrus",
                lifeform = "Shrub",
                leafform = "Needleleaved",
                phenology = "Evergreen",
                zone = "Mediterranean",
                colour = "darkseagreen4",
                combine = "None"
  ),
  
  MRS = new("PFT",
            id = "MRS",
            name = "Mediterranean Raingreen Shrub",
            lifeform = "Shrub",
            leafform = "Unspecified_Leafform",
            phenology = "Raingreen",
            zone = "Mediterranean",
            colour = "pink",
            combine = "None"
  ),
  
  Pic_abi = new("PFT",
                id = "Pic_abi",
                name = "Picea abies",
                lifeform = "Tree",
                leafform = "Needleleaved",
                phenology = "Evergreen",
                zone = "Boreal",
                colour = "darkslateblue",
                combine = "None"
  ),
  
  Pic_sit = new("PFT",
                id = "Pic_sit",
                name = "Picea sitchensis",
                lifeform = "Tree",
                leafform = "Needleleaved",
                phenology = "Evergreen",
                zone = "Boreal",
                colour = "black",
                combine = "None"
  ),
  
  Pin_syl = new("PFT",
                id = "Pin_syl",
                name = "Pinus sylvestris",
                lifeform = "Tree",
                leafform = "Needleleaved",
                phenology = "Evergreen",
                zone = "Boreal",
                colour = "darkorchid4",
                combine = "None"
  ),
  
  Pin_hal = new("PFT",
                id = "Pin_hal",
                name = "Pinus halepensis",
                lifeform = "Tree",
                leafform = "Needleleaved",
                phenology = "Evergreen",
                zone = "Mediterranean",
                colour = "orangered",
                combine = "None"
  ),
  
  Pop_tre = new("PFT",
                id = "Pop_tre",
                name = "Populus tremula",
                lifeform = "Tree",
                leafform = "Broadleaved",
                phenology = "Summergreen",
                zone = "Temperate",
                colour = "lightsteelblue3",
                combine = "None"
  ),
  
  Que_coc = new("PFT",
                id = "Que_coc",
                name = "Quercus coccifera",
                lifeform = "Shrub",
                leafform = "Unspecified_Leafform",
                phenology = "Evergreen",
                zone = "Mediterranean",
                colour = "magenta",
                combine = "None"
  ),
  
  Que_ile = new("PFT",
                id = "Que_ile",
                name = "Quercus ilex",
                lifeform = "Tree",
                leafform = "Broadleaved",
                phenology = "Evergreen",
                zone = "Mediterranean",
                colour = "violetred",
                combine = "None"
  ),
  
  Que_pub = new("PFT",
                id = "Que_pub",
                name = "Quercus pubescens",
                lifeform = "Tree",
                leafform = "Broadleaved",
                phenology = "Summergreen",
                zone = "Supra-mediterranean",
                colour = "springgreen4",
                combine = "None"
  ),
  
  Que_rob = new("PFT",
                id = "Que_rob",
                name = "Quercus robur",
                lifeform = "Tree",
                leafform = "Broadleaved",
                phenology = "Summergreen",
                zone = "Temperate",
                colour = "seagreen3",
                combine = "None"
  ),
  
  Til_cor = new("PFT",
                id = "Til_cor",
                name = "Tilia cordata",
                lifeform = "Tree",
                leafform = "Broadleaved",
                phenology = "Summergreen",
                zone = "Temperate",
                colour = "limegreen",
                combine = "None"
  ),
  
  Ulm_gla = new("PFT",
                id = "Ulm_gla",
                name = "Ulmus glabra",
                lifeform = "Tree",
                leafform = "Broadleaved",
                phenology = "Summergreen",
                zone = "Temperate",
                colour = "olivedrab",
                combine = "None"
  ),
  
  C3_gr = new("PFT",
              id = "C3_gr",
              name = "C3 herbacious",
              lifeform = "Grass",
              leafform = "Unspecified_Leafform",
              phenology = "GrassPhenology",
              zone = "Temperate-boreal",
              colour = "lightgoldenrod1",
              combine = "None"
  ),
  
  C4_gr = new("PFT",
              id = "C4_gr",
              name = "C4 herbacious",
              lifeform = "Grass",
              leafform = "Unspecified_Leafform",
              phenology = "GrassPhenology",
              zone = "Tropical",
              colour = "sienna2",
              combine = "None"
  ),
  
  Bare = new("PFT",
             id = "Bare",
             name = "Bare ground",
             lifeform = "NA",
             leafform = "NA",
             phenology = "NA",
             zone = "NA",
             colour = "grey80",
             combine = "None"
  ),
  
  None = new("PFT",
             id = "None",
             name = "Nothing here",
             lifeform = "NA",
             leafform = "NA",
             phenology = "NA",
             zone = "NA",
             colour = "grey80",
             combine = "None"
  ),
  
  Total = new("PFT",
              id = "Total",
              name = "Total",
              lifeform = "NA",
              leafform = "NA",
              phenology = "NA",
              zone = "NA", 
              colour = "black",
              combine = "None"
  )
)

