## Aggregate GBR10 at reef scale
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
benthic <- pin_download(gbrmpa_board, 'GBR10_Benthic') %>% rast()

# read in file locally
# benthic <- rast('data/GBR10 GBRMP Benthic.tif')
benthic
crs(benthic)

plot(benthic)

## patches function
## will replace classification (Rubble, coral/algae etc) with patch ID...