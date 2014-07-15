calculateCoords <- function(data, objects, fts){
  dataObject <- matrix(, nrow=length(objects)/2, ncol=8)
  count <- 1
  lengthObjects <- length(objects)/2
  lengthFts <- length(fts)/5
  for (i in objects) {
    if (count > length(objects)/2){
      break
    }
    coordAbs <- getAbsCoord(data, objects[count], objects[lengthObjects + count])
    dataObject[count,1] <- objects[count]
    dataObject[count,2] <- objects[lengthObjects + count]
    dataObject[count,3] <- coordAbs$xab
    dataObject[count,4] <- coordAbs$yab
    radius <- ceiling(fts[lengthFts*2 +count])
    Xmin <- ceiling(objects[count] - radius)
    Xmax <- ceiling(objects[count] + radius)
    Ymin <- ceiling(objects[lengthObjects + count] - radius)
    Ymax <- ceiling(objects[lengthObjects + count] + radius)
    aux <- getAbsCoord(data, Xmin, Ymin)
    aux2 <- getAbsCoord(data, Xmax, Ymax)
    if (aux$xab > aux2$xab) {
      dataObject[count,7] <- aux$xab
      dataObject[count,5] <- aux2$xab
    }
    else {
      dataObject[count,5] <- aux$xab
      dataObject[count,7] <- aux2$xab
    }
    if (aux$yab > aux2$yab) {
      dataObject[count,8] <- aux$yab
      dataObject[count,6] <- aux2$yab
    }
    else {
      dataObject[count,6] <- aux$yab
      dataObject[count,8] <- aux2$yab
    }
    count <- count + 1
  }
  dimnames(dataObject) = list(c(1:(count-1)),
    c("xloc", "yloc", "xabs", "yabs", "minDEC", "minRA", "maxDEC", "maxRA"))
  return(dataObject)
}