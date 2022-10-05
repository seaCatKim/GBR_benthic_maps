## Make a map of the GBR10 raster
## Catherine Kim
## August 2, 2022

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
# read in file from U drive
gbrmpa_board <- board_folder("U:\\Research\\Projects\\sef\\rrap_rubble\\Data _all\\GBRMPA_board")

benthic <- pin_download(gbrmpa_board, 'GBR10_Benthic') %>% rast()
#benthic <- rast('../data/GBR10 GBRMP Benthic.tif')

# read in file locally
# benthic <- rast('data/GBR10 GBRMP Benthic.tif')
benthic
crs(benthic)

#agg_benthic <- terra::aggregate(benthic, fact = 20)
agg_benthic <- rast('processed_data/agg100_GBR10.tif')
agg_benthic

# basic plot
plot(benthic)
qtm(benthic)

# tmap plot ----
# too big, try aggregating times 10
#agg_benthic <- terra::aggregate(benthic, fun = "modal", fact = 100)
#writeRaster(agg_benthic, 'processed_data/agg100_GBR10.tif')

plot(agg_benthic)
qtm(agg_benthic)

tm_shape(agg_benthic) +
  tm_raster(title = "Classifcations") +
  tm_layout(legend.position = c("RIGHT", "top"),
            bg.color = "steelblue4")

