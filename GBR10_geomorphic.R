## GBRMPA bioregions 2020
## Catherine Kim
Sys.Date()

## Install and load packages
#install.packages(c("terra", "tmap", "ozmaps"))

library(terra)
terraOptions()
terraOptions(tempdir = "U:/Research/Projects/sef/rrap_rubble/Data _all/Personal_WIP/Catherine/rubble/temp",
             memfrac = 0.9)
library(tmap)
library(ozmaps)
library(pins)

# Read in the data ----
# read in file gbrmpa board

gbrmpa_board <- board_folder("U:\\Research\\Projects\\sef\\rrap_rubble\\Data _all\\GBRMPA_board")
gbrmpa_board

gbrmpa_board |>
  pin_upload('U:\\Research\\Projects\\sef\\rrap_rubble\\Data _all\\Original external data -DO NOT EDIT\\general_GIS_shp\\gbrmpa\\GBR10_GBRMP_Geomorphic\\GBR10 GBRMP Geomorphic.tif',
             name = 'GBR10_Geomorphic',
             description = 'The GBR10 Geomorphic Zones from GBRMPA')

geomorph <- pin_download(gbrmpa_board, 'GBR10_Geomorphic') %>% rast()
geomorph
plot(geomorph)

### Value key
# 2 Deep
# 11 Shallow Lagoon
# 12 Deep Lagoon
# 13 Inner Reef Flat
# 14 Outer Reef Flat
# 15 Reef Crest
# 21 Sheltered Reef Slope
# 22 Reef Slope
# 23 Plateau
# 24 Back Reef Slope
# 25 Patch Reef
