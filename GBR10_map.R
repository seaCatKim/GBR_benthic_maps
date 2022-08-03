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

# basic plot
plot(benthic)

# tmap plot ----
# too big, try aggregating times 10
agg_benthic <- terra::aggregate(benthic, fact = 20)

tm_shape(agg_benthic) +
  tm_raster()
