getCoordData <- function(header){
  return (list(CRVAL1=as.numeric(header[which(header=="CRVAL1")+1]),
    CRVAL2=as.numeric(header[which(header=="CRVAL2")+1]),
    CRPIX1=as.numeric(header[which(header=="CRPIX1")+1]),
    CRPIX2=as.numeric(header[which(header=="CRPIX2")+1]),
    CD1_1=as.numeric(header[which(header=="CD1_1")+1]),
    CD1_2=as.numeric(header[which(header=="CD1_2")+1]),
    CD2_1=as.numeric(header[which(header=="CD2_1")+1]),
    CD2_2=as.numeric(header[which(header=="CD2_2")+1]),
    NAXIS1=as.numeric(header[which(header=="NAXIS1")+1]),
    NAXIS2=as.numeric(header[which(header=="NAXIS2")+1])))
}