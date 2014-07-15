mainFunction <- function(database, fits) {
  ptm <- proc.time()
  im <- readFITS(fits)
  xy <- getObjects(im)
  coordData <- getCoordData(im$hdr)
  absCoord <- calculateCoords(coordData, xy[[1]], xy[[2]])
  writeToDataBase(database, absCoord, fits)
  print("Process Finished")
  print(sprintf("Imagen fits: %s", fits))
  print(sprintf("%s Objects identified and archived", (length(xy[[1]])/2)))
  proc.time() - ptm
}