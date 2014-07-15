getAbsCoord <- function(data, xloc, yloc){
  wcs1 <- data$CD1_1*(xloc-data$CRPIX1) + data$CD1_2*(yloc-data$CRPIX2)
  wcs2 <- data$CD2_1*(xloc-data$CRPIX1) + data$CD2_2*(yloc-data$CRPIX2)
  xabs <- data$CRVAL1 - wcs1
  yabs <- data$CRVAL2 - wcs2
  #dec <- data$CD1_1*(xloc) + data$CD1_2*(yloc)
  #ra <- data$CD2_1*(xloc) + data$CD2_2*(yloc)
  return(list(xab=xabs, yab=yabs))
}