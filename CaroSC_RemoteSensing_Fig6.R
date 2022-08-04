## Fig 6 from Carolina Sanguio-Castro
## Remote Sensing paper

##------------------------------------------------------------
##Figure 6. Create grid for summarised data per 2-degrees cells
##------------------------------------------------------------

offshorebenthic=benthic_slope%>%
  filter(!shelf_edited=="Inner")%>%
  droplevels()%>%
  group_by(UNIQUE_ID,CENTROID_X,CENTROID_Y)%>%
  summarise(`Total`=(sum(Sand+Rubble)/1e6),`Suitable for corals`=(sum(Rock+Coral_Algae)/1e6))

require(raster)
# set up an 'empty' raster, here via an extent object derived from data
e <- extent(c(143.0,152.8,-24.11,-10.69))
r <- raster(e, resolution=0.2) ## this is the size of the grid: 2 degrees
# provide a function 'fun' for when there are multiple points per cell
x <- rasterize(offshorebenthic[, 2:3], r, offshorebenthic[,4:5], fun=sum)

offshorebenthic <- rasterToPoints(x)

##Stacked Barplot
offshorebenthic%>%
  as.data.frame(offshorebenthic)%>%
  group_by(y)%>%summarise(`Total`=sum(`Total`),`Suitable for corals`=sum(Suitable.for.corals))%>%
  tidyr::gather(key="Reef Area", value="area",`Suitable for corals`,"Total")%>%
  ggplot(aes(fill=`Reef Area`, y=area, x=y)) +
  geom_bar(position = position_stack(reverse = TRUE), stat="identity")+scale_fill_manual(values = c("#CF6A6A", "grey79"))+coord_flip()+
  ggtitle("Reef extent and coral habitat\nBenthic < 10m")+
  theme_minimal()+theme(legend.position = "top")+
  xlab("Latitude")+ylab(expression("Area-Km" ^2))

#ggsave(file="latitufinal coral habitat area.jpeg", width = 12, height=15, units = "cm")