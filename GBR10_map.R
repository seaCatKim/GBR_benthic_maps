## Make a map of the GBR10 raster
## Catherine Kim
## August 2, 2022

## Install and load packages
#install.packages(c("terra", "tmap", "ozmaps"))

library(terra)
library(tmap)
library(ozmaps)

# Read in the data ----
benthic <- rast('data/GBR10 GBRMP Benthic.tif')
benthic
crs(benthic)

#agg_benthic <- terra::aggregate(benthic, fact = 20)
agg_benthic <- rast('processed_data/agg100_GBR10.tif')
agg_benthic

# basic plot
plot(benthic)

# tmap plot ----
# too big, try aggregating times 10

qtm(agg_benthic)

tm_shape(agg_benthic) +
  tm_raster(title = "Classifcations") +
  tm_layout(legend.position = c("RIGHT", "top"),
            bg.color = "steelblue4")

